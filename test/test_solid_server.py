import docker
import pytest

testinfra_hosts = ['docker://test_container']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="test_container",
        detach=True,
        tty=True
    )
    yield container
    container.remove(force=True)

def test_solid_command_is_available(host):
    assert host.exists("solid")

def test_solid_is_running(host):
    solid = host.process.get(comm="node")
    assert solid.args == "node /usr/local/bin/solid start"
    assert solid.user == "node"
    assert solid.group == "node"