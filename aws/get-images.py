import boto3

image_name = "CentOS Linux 7 x86_64 HVM EBS ENA 1804_02*"
region_names = []
ami_ids = {}

client = boto3.client('ec2')


def get_regions():

    regions = client.describe_regions()
    # print(regions['Regions'])

    for region in regions['Regions']:
        region_names.append(region['RegionName'])
    return region_names


def get_ami_ids():

    for region in region_names:
        client = boto3.client('ec2', region_name=region)

        response = client.describe_images(
            Filters=[
                {
                    'Name': 'name',
                    'Values': [
                        image_name,
                    ]
                }
            ]
        )

        if response['Images']:
            # print(response['Images'][0]['ImageId'])
            ami_ids[region] = response['Images'][0]['ImageId']


def print_for_terraform():

    for region, ami in ami_ids.items():
        print("{} = \"{}\"" .format(region, ami))


get_regions()
get_ami_ids()
print_for_terraform()
