import boto3

image_name = "F5 Networks Licensed Hourly BIGIP-12.1.3.3-0.0.1 Best 25MBPS*"
region_names = []
ami_ids = {}

boto3.setup_default_session(profile_name='matr-ops-research')

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
