Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5A76576A
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 17:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690471491;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UCRTbqxaoC/Jp62ap2OTBbGW32S3yubuMGrSUwCxnys=;
	b=esUeW5r+iekzzSQ3TuyurCL+14q1zSPMkNnzSaqaC4/eT6SWDr5B+/uLbi82c5FpFHVtsz
	D44lDk83bVsEy065DbcCjr9Cc/IhnUHy6Ks3mFaxLtSohlwqPI5EAEjWhW2G+cmQtuWquL
	m/1vqIGOWtcWB5iCZbbjObBnJgmWY8c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-yLREFz3hO1O3jy54DQtqWg-1; Thu, 27 Jul 2023 11:24:46 -0400
X-MC-Unique: yLREFz3hO1O3jy54DQtqWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A80881DA5D;
	Thu, 27 Jul 2023 15:24:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C89241454147;
	Thu, 27 Jul 2023 15:24:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 90D521946A6A;
	Thu, 27 Jul 2023 15:24:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CCCB91946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 15:24:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC3634094DC1; Thu, 27 Jul 2023 15:24:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3BB84094DC0
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 15:24:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FAD52804610
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 15:24:41 +0000 (UTC)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-LnTjJpc2MAOGR9VO15C1ww-1; Thu, 27 Jul 2023 11:24:40 -0400
X-MC-Unique: LnTjJpc2MAOGR9VO15C1ww-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-583b256faf5so17251797b3.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690471479; x=1691076279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCRTbqxaoC/Jp62ap2OTBbGW32S3yubuMGrSUwCxnys=;
 b=CtanTNG7W1WvXT1yhEs0RiUZcm89hvDGrmcwHnLihrsWZ0WhcBlpvQKBkZ7r6JYTS0
 BQwBYoJo9uVTwOq7HUWfRK7k0O45+Ec3FVR+o3zfy+5QtMiV3yHwcHpbG3UiPF+6uGgv
 CrytDmrH149vURETy+gGQlaKk4s9Q9kQ4jcPrBt682hvZxk+PX4CgidtnE9cA4A0zmoM
 HD5+TOXPDz4dQlFqD68JFG81Ow1UtE6wj6HBK8h9eq4n+p8wYFR9jkusF1IGKBJBC6iy
 Lbf08kr0Nx5bFhDxGdrPRVHvyqrpekpRstK/cwyEIVY4Isg38jNm1TkYzdJb7ni0bMUF
 KvFA==
X-Gm-Message-State: ABy/qLYyuxOxTA/Ma/kwDjNZuvfvflawTAkOwl99J3sxvJaS+UsfSWvF
 +LGGEAXM3db9Qxt2kA6HxZ1sIp0GkZNjAMoVFI1n0BGqJrOlEtG9BtkgYH5Yf1ldyDWlfPH3xxC
 GNgTBla4h/AezLsAM3qGtDL6Q+PFK+nBWQLxVr1FYWs63kQmO
X-Received: by 2002:a81:84c9:0:b0:56c:e5a3:3e09 with SMTP id
 u192-20020a8184c9000000b0056ce5a33e09mr3578552ywf.15.1690471479173; 
 Thu, 27 Jul 2023 08:24:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH8eDNe9pI62emkfPTXdHMybKVrvua5lKikN19YXUyt09ZFuK6sgUG2LWWRlE7+MvivHqXYCdR4flm4YheCxIE=
X-Received: by 2002:a81:84c9:0:b0:56c:e5a3:3e09 with SMTP id
 u192-20020a8184c9000000b0056ce5a33e09mr3578531ywf.15.1690471478849; Thu, 27
 Jul 2023 08:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230727132303.3352514-1-aahringo@redhat.com>
 <20230727132303.3352514-12-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-12-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 27 Jul 2023 11:24:27 -0400
Message-ID: <CAK-6q+iFEp-uieJ5XoN3nzwJvBbcE3MeNyGRJx6U9D5PP7OULg@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH dlm-next 12/13] fs: dlm: create midcomms
 nodes when configure
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 27, 2023 at 9:23=E2=80=AFAM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> This patch puts the life of a midcomms node the same as a lowcomms
> connection. The lowcomms connection lifetime was changed by commit
> 6f0b0b5d7ae7 ("fs: dlm: remove dlm_node_addrs lookup list"). In the
> future the midcomms node instances can be merged with lowcomms
> connection structure as the lifetime is the same and states can be
> controlled over values or flags.
>
> Before midcomms nodes were generated during version detection. This is
> not necessary anymore when the nodes are created when the cluster
> manager configures DLM via configfs. When a midcomms node is created over
> configfs it well set DLM_VERSION_NOT_SET as version. This indicates that
> the version of the midcomms node is still unknown and need to be probed
> via certain rcom messages.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/config.c   |   2 +-
>  fs/dlm/midcomms.c | 286 +++++++++++++++++-----------------------------
>  fs/dlm/midcomms.h |   1 +
>  3 files changed, 110 insertions(+), 179 deletions(-)
>
> diff --git a/fs/dlm/config.c b/fs/dlm/config.c
> index 2beceff024e3..e55e0a2cd2e8 100644
> --- a/fs/dlm/config.c
> +++ b/fs/dlm/config.c
> @@ -664,7 +664,7 @@ static ssize_t comm_addr_store(struct config_item *it=
em, const char *buf,
>
>         memcpy(addr, buf, len);
>
> -       rv =3D dlm_lowcomms_addr(cm->nodeid, addr, len);
> +       rv =3D dlm_midcomms_addr(cm->nodeid, addr, len);
>         if (rv) {
>                 kfree(addr);
>                 return rv;
> diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
> index c125496e03bf..24952ecf8e1a 100644
> --- a/fs/dlm/midcomms.c
> +++ b/fs/dlm/midcomms.c
> @@ -330,18 +330,23 @@ static void midcomms_node_reset(struct midcomms_nod=
e *node)
>         wake_up(&node->shutdown_wait);
>  }
>
> -static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
> +static struct midcomms_node *nodeid2node(int nodeid)
>  {
> -       struct midcomms_node *node, *tmp;
> -       int r =3D nodeid_hash(nodeid);
> +       return __find_node(nodeid, nodeid_hash(nodeid));
> +}
> +
> +int dlm_midcomms_addr(int nodeid, struct sockaddr_storage *addr, int len=
)
> +{
> +       int ret, r =3D nodeid_hash(nodeid);
> +       struct midcomms_node *node;
>
> -       node =3D __find_node(nodeid, r);
> -       if (node || !alloc)
> -               return node;
> +       ret =3D dlm_lowcomms_addr(nodeid, addr, len);
> +       if (ret)
> +               return ret;
>
> -       node =3D kmalloc(sizeof(*node), alloc);
> +       node =3D kmalloc(sizeof(*node), GFP_NOFS);
>         if (!node)
> -               return NULL;
> +               return -ENOMEM;
>
>         node->nodeid =3D nodeid;
>         spin_lock_init(&node->state_lock);
> @@ -353,21 +358,11 @@ static struct midcomms_node *nodeid2node(int nodeid=
, gfp_t alloc)
>         midcomms_node_reset(node);
>
>         spin_lock(&nodes_lock);
> -       /* check again if there was somebody else
> -        * earlier here to add the node
> -        */
> -       tmp =3D __find_node(nodeid, r);
> -       if (tmp) {
> -               spin_unlock(&nodes_lock);
> -               kfree(node);
> -               return tmp;
> -       }
> -
>         hlist_add_head_rcu(&node->hlist, &node_hash[r]);
>         spin_unlock(&nodes_lock);
>
>         node->debugfs =3D dlm_create_debug_comms_file(nodeid, node);
> -       return node;
> +       return 0;
>  }
>
>  static int dlm_send_ack(int nodeid, uint32_t seq)
> @@ -603,112 +598,6 @@ static void dlm_midcomms_receive_buffer(const union=
 dlm_packet *p,
>         }
>  }
>
> -static struct midcomms_node *
> -dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
> -                             uint16_t msglen, int (*cb)(struct midcomms_=
node *node))
> -{
> -       struct midcomms_node *node =3D NULL;
> -       gfp_t allocation =3D 0;
> -       int ret;
> -
> -       switch (p->header.h_cmd) {
> -       case DLM_RCOM:
> -               if (msglen < sizeof(struct dlm_rcom)) {
> -                       log_print("rcom msg too small: %u, will skip this=
 message from node %d",
> -                                 msglen, nodeid);
> -                       return NULL;
> -               }
> -
> -               switch (p->rcom.rc_type) {
> -               case cpu_to_le32(DLM_RCOM_NAMES):
> -                       fallthrough;
> -               case cpu_to_le32(DLM_RCOM_NAMES_REPLY):
> -                       fallthrough;
> -               case cpu_to_le32(DLM_RCOM_STATUS):
> -                       fallthrough;
> -               case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
> -                       node =3D nodeid2node(nodeid, 0);
> -                       if (node) {
> -                               spin_lock(&node->state_lock);
> -                               if (node->state !=3D DLM_ESTABLISHED)
> -                                       pr_debug("receive begin RCOM msg =
from node %d with state %s\n",
> -                                                node->nodeid, dlm_state_=
str(node->state));
> -
> -                               switch (node->state) {
> -                               case DLM_CLOSED:
> -                                       node->state =3D DLM_ESTABLISHED;
> -                                       pr_debug("switch node %d to state=
 %s\n",
> -                                                node->nodeid, dlm_state_=
str(node->state));
> -                                       break;
> -                               case DLM_ESTABLISHED:
> -                                       break;
> -                               default:
> -                                       spin_unlock(&node->state_lock);
> -                                       return NULL;
> -                               }
> -                               spin_unlock(&node->state_lock);
> -                       }
> -
> -                       allocation =3D GFP_NOFS;
> -                       break;
> -               default:
> -                       break;
> -               }
> -
> -               break;
> -       default:
> -               break;
> -       }
> -
> -       node =3D nodeid2node(nodeid, allocation);
> -       if (!node) {
> -               switch (p->header.h_cmd) {
> -               case DLM_OPTS:
> -                       if (msglen < sizeof(struct dlm_opts)) {
> -                               log_print("opts msg too small: %u, will s=
kip this message from node %d",
> -                                         msglen, nodeid);
> -                               return NULL;
> -                       }
> -
> -                       log_print_ratelimited("received dlm opts message =
nextcmd %d from node %d in an invalid sequence",
> -                                             p->opts.o_nextcmd, nodeid);
> -                       break;
> -               default:
> -                       log_print_ratelimited("received dlm message cmd %=
d from node %d in an invalid sequence",
> -                                             p->header.h_cmd, nodeid);
> -                       break;
> -               }
> -
> -               return NULL;
> -       }
> -
> -       ret =3D cb(node);
> -       if (ret < 0)
> -               return NULL;
> -
> -       return node;
> -}
> -
> -static int dlm_midcomms_version_check_3_2(struct midcomms_node *node)
> -{
> -       switch (node->version) {
> -       case DLM_VERSION_NOT_SET:
> -               node->version =3D DLM_VERSION_3_2;
> -               wake_up(&node->shutdown_wait);
> -               log_print("version 0x%08x for node %d detected", DLM_VERS=
ION_3_2,
> -                         node->nodeid);
> -               break;
> -       case DLM_VERSION_3_2:
> -               break;
> -       default:
> -               log_print_ratelimited("version mismatch detected, assumed=
 0x%08x but node %d has 0x%08x",
> -                                     DLM_VERSION_3_2, node->nodeid, node=
->version);
> -               return -1;
> -       }
> -
> -       return 0;
> -}
> -
>  static int dlm_opts_check_msglen(const union dlm_packet *p, uint16_t msg=
len,
>                                  int nodeid)
>  {
> @@ -767,10 +656,37 @@ static void dlm_midcomms_receive_buffer_3_2(const u=
nion dlm_packet *p, int nodei
>         int ret, idx;
>
>         idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
> -                                            dlm_midcomms_version_check_3=
_2);
> -       if (!node)
> +       node =3D nodeid2node(nodeid);
> +       if (WARN_ON_ONCE(!node))
> +               goto out;
> +
> +       switch (node->version) {
> +       case DLM_VERSION_NOT_SET:
> +               node->version =3D DLM_VERSION_3_2;
> +               wake_up(&node->shutdown_wait);
> +               log_print("version 0x%08x for node %d detected", DLM_VERS=
ION_3_2,
> +                         node->nodeid);
> +
> +               spin_lock(&node->state_lock);
> +               switch (node->state) {
> +               case DLM_CLOSED:
> +                       node->state =3D DLM_ESTABLISHED;
> +                       pr_debug("switch node %d to state %s\n",
> +                                node->nodeid, dlm_state_str(node->state)=
);
> +                       break;
> +               default:
> +                       break;
> +               }
> +               spin_unlock(&node->state_lock);
> +
> +               break;
> +       case DLM_VERSION_3_2:
> +               break;
> +       default:
> +               log_print_ratelimited("version mismatch detected, assumed=
 0x%08x but node %d has 0x%08x",
> +                                     DLM_VERSION_3_2, node->nodeid, node=
->version);
>                 goto out;
> +       }
>
>         switch (p->header.h_cmd) {
>         case DLM_RCOM:
> @@ -860,8 +776,19 @@ static void dlm_midcomms_receive_buffer_3_2(const un=
ion dlm_packet *p, int nodei
>         srcu_read_unlock(&nodes_srcu, idx);
>  }
>
> -static int dlm_midcomms_version_check_3_1(struct midcomms_node *node)
> +static void dlm_midcomms_receive_buffer_3_1(const union dlm_packet *p, i=
nt nodeid)
>  {
> +       uint16_t msglen =3D le16_to_cpu(p->header.h_length);
> +       struct midcomms_node *node;
> +       int idx;
> +
> +       idx =3D srcu_read_lock(&nodes_srcu);
> +       node =3D nodeid2node(nodeid);
> +       if (WARN_ON_ONCE(!node)) {
> +               srcu_read_unlock(&nodes_srcu, idx);
> +               return;
> +       }
> +
>         switch (node->version) {
>         case DLM_VERSION_NOT_SET:
>                 node->version =3D DLM_VERSION_3_1;
> @@ -874,22 +801,6 @@ static int dlm_midcomms_version_check_3_1(struct mid=
comms_node *node)
>         default:
>                 log_print_ratelimited("version mismatch detected, assumed=
 0x%08x but node %d has 0x%08x",
>                                       DLM_VERSION_3_1, node->nodeid, node=
->version);
> -               return -1;
> -       }
> -
> -       return 0;
> -}
> -
> -static void dlm_midcomms_receive_buffer_3_1(const union dlm_packet *p, i=
nt nodeid)
> -{
> -       uint16_t msglen =3D le16_to_cpu(p->header.h_length);
> -       struct midcomms_node *node;
> -       int idx;
> -
> -       idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
> -                                            dlm_midcomms_version_check_3=
_1);
> -       if (!node) {
>                 srcu_read_unlock(&nodes_srcu, idx);
>                 return;
>         }
> @@ -1005,8 +916,8 @@ void dlm_midcomms_unack_msg_resend(int nodeid)
>         int idx, ret;
>
>         idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D nodeid2node(nodeid, 0);
> -       if (!node) {
> +       node =3D nodeid2node(nodeid);
> +       if (WARN_ON_ONCE(!node)) {
>                 srcu_read_unlock(&nodes_srcu, idx);
>                 return;
>         }
> @@ -1092,11 +1003,9 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int n=
odeid, int len,
>         int idx;
>
>         idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D nodeid2node(nodeid, 0);
> -       if (!node) {
> -               WARN_ON_ONCE(1);
> +       node =3D nodeid2node(nodeid);
> +       if (WARN_ON_ONCE(!node))
>                 goto err;
> -       }
>
>         /* this is a bug, however we going on and hope it will be resolve=
d */
>         WARN_ON_ONCE(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
> @@ -1237,8 +1146,34 @@ void dlm_midcomms_init(void)
>         dlm_lowcomms_init();
>  }
>
> +static void midcomms_node_release(struct rcu_head *rcu)
> +{
> +       struct midcomms_node *node =3D container_of(rcu, struct midcomms_=
node, rcu);
> +
> +       WARN_ON_ONCE(atomic_read(&node->send_queue_cnt));
> +       dlm_send_queue_flush(node);
> +       kfree(node);
> +}
> +
>  void dlm_midcomms_exit(void)
>  {
> +       struct midcomms_node *node;
> +       int i, idx;
> +
> +       idx =3D srcu_read_lock(&nodes_srcu);
> +       for (i =3D 0; i < CONN_HASH_SIZE; i++) {
> +               hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
> +                       dlm_delete_debug_comms_file(node->debugfs);
> +
> +                       spin_lock(&nodes_lock);
> +                       hlist_del_rcu(&node->hlist);
> +                       spin_unlock(&nodes_lock);
> +
> +                       call_srcu(&nodes_srcu, &node->rcu, midcomms_node_=
release);
> +               }
> +       }
> +       srcu_read_unlock(&nodes_srcu, idx);
> +
>         dlm_lowcomms_exit();
>  }
>
> @@ -1279,8 +1214,8 @@ void dlm_midcomms_add_member(int nodeid)
>         int idx;
>
>         idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D nodeid2node(nodeid, GFP_NOFS);
> -       if (!node) {
> +       node =3D nodeid2node(nodeid);
> +       if (WARN_ON_ONCE(!node)) {
>                 srcu_read_unlock(&nodes_srcu, idx);
>                 return;
>         }
> @@ -1324,8 +1259,8 @@ void dlm_midcomms_remove_member(int nodeid)
>         int idx;
>
>         idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D nodeid2node(nodeid, 0);
> -       if (!node) {
> +       node =3D nodeid2node(nodeid);
> +       if (WARN_ON_ONCE(!node)) {
>                 srcu_read_unlock(&nodes_srcu, idx);
>                 return;
>         }
> @@ -1369,15 +1304,6 @@ void dlm_midcomms_remove_member(int nodeid)
>         srcu_read_unlock(&nodes_srcu, idx);
>  }
>
> -static void midcomms_node_release(struct rcu_head *rcu)
> -{
> -       struct midcomms_node *node =3D container_of(rcu, struct midcomms_=
node, rcu);
> -
> -       WARN_ON_ONCE(atomic_read(&node->send_queue_cnt));
> -       dlm_send_queue_flush(node);
> -       kfree(node);
> -}
> -
>  void dlm_midcomms_version_wait(void)
>  {
>         struct midcomms_node *node;
> @@ -1440,7 +1366,7 @@ static void midcomms_shutdown(struct midcomms_node =
*node)
>                                  node->state =3D=3D DLM_CLOSED ||
>                                  test_bit(DLM_NODE_FLAG_CLOSE, &node->fla=
gs),
>                                  DLM_SHUTDOWN_TIMEOUT);
> -       if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
> +       if (!ret)
>                 pr_debug("active shutdown timed out for node %d with stat=
e %s\n",
>                          node->nodeid, dlm_state_str(node->state));
>         else
> @@ -1458,14 +1384,6 @@ void dlm_midcomms_shutdown(void)
>         for (i =3D 0; i < CONN_HASH_SIZE; i++) {
>                 hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
>                         midcomms_shutdown(node);
> -
> -                       dlm_delete_debug_comms_file(node->debugfs);
> -
> -                       spin_lock(&nodes_lock);
> -                       hlist_del_rcu(&node->hlist);
> -                       spin_unlock(&nodes_lock);
> -
> -                       call_srcu(&nodes_srcu, &node->rcu, midcomms_node_=
release);
>                 }
>         }
>         srcu_read_unlock(&nodes_srcu, idx);
> @@ -1481,7 +1399,7 @@ int dlm_midcomms_close(int nodeid)
>
>         idx =3D srcu_read_lock(&nodes_srcu);
>         /* Abort pending close/remove operation */
> -       node =3D nodeid2node(nodeid, 0);
> +       node =3D nodeid2node(nodeid);
>         if (node) {
>                 /* let shutdown waiters leave */
>                 set_bit(DLM_NODE_FLAG_CLOSE, &node->flags);
> @@ -1493,7 +1411,7 @@ int dlm_midcomms_close(int nodeid)
>
>         mutex_lock(&close_lock);
>         idx =3D srcu_read_lock(&nodes_srcu);
> -       node =3D nodeid2node(nodeid, 0);
> +       node =3D nodeid2node(nodeid);
>         if (!node) {
>                 srcu_read_unlock(&nodes_srcu, idx);
>                 mutex_unlock(&close_lock);
> @@ -1501,9 +1419,21 @@ int dlm_midcomms_close(int nodeid)
>         }
>
>         ret =3D dlm_lowcomms_close(nodeid);
> -       spin_lock(&node->state_lock);
> -       midcomms_node_reset(node);
> -       spin_unlock(&node->state_lock);
> +       dlm_delete_debug_comms_file(node->debugfs);
> +
> +       spin_lock(&nodes_lock);
> +       hlist_del_rcu(&node->hlist);
> +       spin_unlock(&nodes_lock);
> +
> +       /* wait that all readers left until flush send queue */
> +       synchronize_srcu(&nodes_srcu);
> +

This will obviously deadlock when holding the nodes_srcu read lock. I
have a small fix for it by moving srcu_read_unlock(&nodes_srcu, idx);
right after we removed the node from the hash.

- Alex

