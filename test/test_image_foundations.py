import docker
import pytest

testinfra_hosts = ['docker://test_container']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="test_container",
        detach=True,
        tty=True,
        command="sh"
    )
    yield container
    container.remove(force=True)

def test_solid_home_dir_exists(host):
    assert host.file("/opt/solid").is_directory

def test_node_command_is_available(host):
    assert host.exists("node")

def test_node_version_is_10(host):
    assert host.check_output("node --version").startswith('v10')

def test_current_user_is_node(host):
    assert host.user().name == "node"
    assert host.user().group == "node"
