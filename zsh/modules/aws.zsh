#!/bin/bash

function emr-get-cluster-id() {
    # $1 Cluster name
    if aws sts get-caller-identity > /dev/null 2>&1; then
        CLUSTER_ID=$(aws emr list-clusters \
            | jq -r --arg CLUSTER_NAME $1 '[.Clusters[] 
            | select(.Name==$CLUSTER_NAME and (.Status.State | startswith("TERMINATED") | not))
            | .Id][0]')
        
        echo $CLUSTER_ID
    else
        echo "AWS token expired"
    fi
}

function emr-get-master-ip() {
    # $1 Cluster name
    if aws sts get-caller-identity > /dev/null 2>&1; then
        CLUSTER_ID=$(emr-get-cluster-id $1)

        if [[ $CLUSTER_ID != 'null' ]]; then
            INSTANCE_FLEET_ID=$(aws emr describe-cluster --cluster-id $CLUSTER_ID \
                | jq -r '.[].InstanceFleets
                | .[]
                | select(.InstanceFleetType=="MASTER")
                | .Id')

            MASTER_IP=$(aws emr list-instances --cluster-id $CLUSTER_ID \
                | jq -r --arg ID $INSTANCE_FLEET_ID '.[]
                | .[]
                | select(.InstanceFleetId==$ID) 
                | .PrivateIpAddress')

            echo $MASTER_IP
        else
            echo $CLUSTER_ID
        fi
    else
        echo "AWS token expired"
    fi
}

function emr-tunnel() {
    function help() {
        echo "Open a tunnel to an AWS EMR cluster"
        echo
        echo "Options:"
        echo "-i Path to AWS .pem key"
        echo "-n Cluster name"
        echo "-p Port"
        echo
    }

    while getopts ":i:n:p:" opt; do
        case ${opt} in
            i) 
                AWS_KEY_PATH=$OPTARG; 
                ;;
            n) 
                CLUSTER_NAME=$OPTARG;
                ;;
            p)
                PORT=$OPTARG;
                ;;
            *)
                help
                return 1
                ;;
        esac
    done

    # No options specified
    if (( $OPTIND == 1 )); then 
        help
        return 1
    fi

    echo "Fetching Master's IP"
    MASTER_IP=$(emr-get-master-ip $CLUSTER_NAME)

    if [[ ${MASTER_IP} != "AWS token expired" ]] && [[ ${MASTER_IP} != "null" ]]; then
        echo "SSH tunnel to ${MASTER_IP} in port $PORT is configured..."
        ssh -i ${AWS_KEY_PATH} -N -L ${PORT}:localhost:${PORT} hadoop@${MASTER_IP}
    else
        echo ${MASTER_IP}
    fi
}

function emr-terminate-cluster() {
    # $1 Cluster name
    if aws sts get-caller-identity > /dev/null 2>&1; then
        CLUSTER_ID=$(emr-get-cluster-id $1)

        if [[ $CLUSTER_ID != 'null' ]]; then
            aws emr terminate-clusters --cluster-id ${CLUSTER_ID}
            echo "Cluster '$1' terminated"
        else
            echo "Cluster '$1' not found"
        fi
    else
        echo "AWS token expired"
    fi  
}