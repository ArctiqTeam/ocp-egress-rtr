# This Dockerfile was orignally based on the the egress router for OpenShift Origin by Red Hat
# The standard name for this image was openshift/origin-egress-router
# Original Author: Red Hat Inc
# It has been modified as required by Arctiq to serve a different use case. 
# Author: Aly Khimji


FROM registry.access.redhat.com/rhel7.4

LABEL version="v1.0"
LABEL release="1"
LABEL architecture="x86_64"
LABEL io.k8s.display-name="OpenShift Container Platform Egress Router" \
      io.k8s.description="This is a component of OpenShift Container Platform and contains an egress router." \
      io.openshift.tags="openshift,router,egress"

RUN INSTALL_PKGS="iproute iputils net-tools" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

ADD pod-router.sh /bin/pod-router.sh

LABEL io.k8s.display-name="OpenShift Origin Egress Router" \
      io.k8s.description="This is a component of OpenShift Origin and contains an egress router." \
      io.openshift.tags="openshift,router,egress"

ENTRYPOINT /bin/pod-router.sh
