Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD25A0529
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Aug 2022 02:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661387268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rPMyqyGZrNyw4Zic4xiN3wwQtcsDPK06ZjeXQQ4ojW4=;
	b=iJuFaeEuAR655UxSLGf+hNGWPU38vLuh9lJbk3tQFa+u95oR51HithguesB2BS9/r4m2A3
	aoT7kGjHBqk4tgp+8Yo0gJGxjQs38SmMVUI7COGm0wgMceap3BLE1td3pwsOypSbKnqLWt
	Yep6neOqSvTfotSwalfWxa39oSzQMFU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-V94NF4f_PXqaoBeENtTHxw-1; Wed, 24 Aug 2022 20:27:43 -0400
X-MC-Unique: V94NF4f_PXqaoBeENtTHxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7ED8037AA;
	Thu, 25 Aug 2022 00:27:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED254C15BB3;
	Thu, 25 Aug 2022 00:27:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B11C91946A5E;
	Thu, 25 Aug 2022 00:27:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 000F21946A62 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 00:26:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E277B2026D07; Thu, 25 Aug 2022 00:26:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3112026D64
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 00:26:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBBE5101E985
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 00:26:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-XCb96Q8IM6KD63XU-pKFeQ-1; Wed, 24 Aug 2022 20:26:18 -0400
X-MC-Unique: XCb96Q8IM6KD63XU-pKFeQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0A6B61A78;
 Thu, 25 Aug 2022 00:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BB8C433D6;
 Thu, 25 Aug 2022 00:18:32 +0000 (UTC)
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Date: Wed, 24 Aug 2022 17:18:30 -0700
Message-Id: <20220825001830.1911524-1-kuba@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH net-next] genetlink: start to validate
 reserved header bytes
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
Cc: linux-s390@vger.kernel.org, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, dev@openvswitch.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 jiri@resnulli.us, linux-pm@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 linux-block@vger.kernel.org, mptcp@lists.linux.dev, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 johannes@sipsolutions.net, linux-wpan@vger.kernel.org,
 wireguard@lists.zx2c4.com, lvs-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We had historically not checked that genlmsghdr.reserved
is 0 on input which prevents us from using those precious
bytes in the future.

One use case would be to extend the cmd field, which is
currently just 8 bits wide and 256 is not a lot of commands
for some core families.

To make sure that new families do the right thing by default
put the onus of opting out of validation on existing families.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: jiri@resnulli.us
CC: johannes@sipsolutions.net
CC: linux-block@vger.kernel.org
CC: osmocom-net-gprs@lists.osmocom.org
CC: linux-wpan@vger.kernel.org
CC: wireguard@lists.zx2c4.com
CC: linux-wireless@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: target-devel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: virtualization@lists.linux-foundation.org
CC: linux-cifs@vger.kernel.org
CC: cluster-devel@redhat.com
CC: mptcp@lists.linux.dev
CC: lvs-devel@vger.kernel.org
CC: netfilter-devel@vger.kernel.org
CC: linux-security-module@vger.kernel.org
CC: dev@openvswitch.org
CC: linux-s390@vger.kernel.org
CC: tipc-discussion@lists.sourceforge.net
---
 drivers/block/nbd.c                      | 1 +
 drivers/net/gtp.c                        | 1 +
 drivers/net/ieee802154/mac802154_hwsim.c | 1 +
 drivers/net/macsec.c                     | 1 +
 drivers/net/team/team.c                  | 1 +
 drivers/net/wireguard/netlink.c          | 1 +
 drivers/net/wireless/mac80211_hwsim.c    | 1 +
 drivers/target/target_core_user.c        | 1 +
 drivers/thermal/thermal_netlink.c        | 1 +
 drivers/vdpa/vdpa.c                      | 1 +
 fs/cifs/netlink.c                        | 1 +
 fs/dlm/netlink.c                         | 1 +
 fs/ksmbd/transport_ipc.c                 | 1 +
 include/linux/genl_magic_func.h          | 1 +
 include/net/genetlink.h                  | 3 +++
 kernel/taskstats.c                       | 1 +
 net/batman-adv/netlink.c                 | 1 +
 net/core/devlink.c                       | 1 +
 net/core/drop_monitor.c                  | 1 +
 net/ethtool/netlink.c                    | 1 +
 net/hsr/hsr_netlink.c                    | 1 +
 net/ieee802154/netlink.c                 | 1 +
 net/ieee802154/nl802154.c                | 1 +
 net/ipv4/fou.c                           | 1 +
 net/ipv4/tcp_metrics.c                   | 1 +
 net/ipv6/ila/ila_main.c                  | 1 +
 net/ipv6/ioam6.c                         | 1 +
 net/ipv6/seg6.c                          | 1 +
 net/l2tp/l2tp_netlink.c                  | 1 +
 net/mptcp/pm_netlink.c                   | 1 +
 net/ncsi/ncsi-netlink.c                  | 1 +
 net/netfilter/ipvs/ip_vs_ctl.c           | 1 +
 net/netlabel/netlabel_calipso.c          | 1 +
 net/netlabel/netlabel_cipso_v4.c         | 1 +
 net/netlabel/netlabel_mgmt.c             | 1 +
 net/netlabel/netlabel_unlabeled.c        | 1 +
 net/netlink/genetlink.c                  | 4 ++++
 net/nfc/netlink.c                        | 1 +
 net/openvswitch/conntrack.c              | 1 +
 net/openvswitch/datapath.c               | 3 +++
 net/openvswitch/meter.c                  | 1 +
 net/psample/psample.c                    | 1 +
 net/smc/smc_netlink.c                    | 3 ++-
 net/smc/smc_pnet.c                       | 3 ++-
 net/tipc/netlink.c                       | 1 +
 net/tipc/netlink_compat.c                | 1 +
 net/wireless/nl80211.c                   | 1 +
 47 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2a709daefbc4..6cec9ce23fd3 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2322,6 +2322,7 @@ static struct genl_family nbd_genl_family __ro_after_=
init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D nbd_connect_genl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(nbd_connect_genl_ops),
+=09.resv_start_op=09=3D NBD_CMD_STATUS + 1,
 =09.maxattr=09=3D NBD_ATTR_MAX,
 =09.policy =3D nbd_attr_policy,
 =09.mcgrps=09=09=3D nbd_mcast_grps,
diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index a208e2b1a9af..15c7dc82107f 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -1859,6 +1859,7 @@ static struct genl_family gtp_genl_family __ro_after_=
init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D gtp_genl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(gtp_genl_ops),
+=09.resv_start_op=09=3D GTP_CMD_ECHOREQ + 1,
 =09.mcgrps=09=09=3D gtp_genl_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(gtp_genl_mcgrps),
 };
diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802=
154/mac802154_hwsim.c
index 38c217bd7c82..2f0544dd7c2a 100644
--- a/drivers/net/ieee802154/mac802154_hwsim.c
+++ b/drivers/net/ieee802154/mac802154_hwsim.c
@@ -630,6 +630,7 @@ static struct genl_family hwsim_genl_family __ro_after_=
init =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D hwsim_nl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(hwsim_nl_ops),
+=09.resv_start_op =3D MAC802154_HWSIM_CMD_NEW_EDGE + 1,
 =09.mcgrps =3D hwsim_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(hwsim_mcgrps),
 };
diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
index ee6087e7b2bf..b82f9f7d0a7d 100644
--- a/drivers/net/macsec.c
+++ b/drivers/net/macsec.c
@@ -3409,6 +3409,7 @@ static struct genl_family macsec_fam __ro_after_init =
=3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D macsec_genl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(macsec_genl_ops),
+=09.resv_start_op=09=3D MACSEC_CMD_UPD_OFFLOAD + 1,
 };
=20
 static netdev_tx_t macsec_start_xmit(struct sk_buff *skb,
diff --git a/drivers/net/team/team.c b/drivers/net/team/team.c
index aac133a1e27a..b1e1239dfade 100644
--- a/drivers/net/team/team.c
+++ b/drivers/net/team/team.c
@@ -2840,6 +2840,7 @@ static struct genl_family team_nl_family __ro_after_i=
nit =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D team_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(team_nl_ops),
+=09.resv_start_op=09=3D TEAM_CMD_PORT_LIST_GET + 1,
 =09.mcgrps=09=09=3D team_nl_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(team_nl_mcgrps),
 };
diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlin=
k.c
index d0f3b6d7f408..0c0644e762e5 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -621,6 +621,7 @@ static const struct genl_ops genl_ops[] =3D {
 static struct genl_family genl_family __ro_after_init =3D {
 =09.ops =3D genl_ops,
 =09.n_ops =3D ARRAY_SIZE(genl_ops),
+=09.resv_start_op =3D WG_CMD_SET_DEVICE + 1,
 =09.name =3D WG_GENL_NAME,
 =09.version =3D WG_GENL_VERSION,
 =09.maxattr =3D WGDEVICE_A_MAX,
diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/m=
ac80211_hwsim.c
index 6e55f153ff26..0b0dae03c2a8 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -4912,6 +4912,7 @@ static struct genl_family hwsim_genl_family __ro_afte=
r_init =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D hwsim_ops,
 =09.n_small_ops =3D ARRAY_SIZE(hwsim_ops),
+=09.resv_start_op =3D HWSIM_CMD_DEL_MAC_ADDR + 1,
 =09.mcgrps =3D hwsim_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(hwsim_mcgrps),
 };
diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core=
_user.c
index 3deaeecb712e..2940559c3086 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -486,6 +486,7 @@ static struct genl_family tcmu_genl_family __ro_after_i=
nit =3D {
 =09.netnsok =3D true,
 =09.small_ops =3D tcmu_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(tcmu_genl_ops),
+=09.resv_start_op =3D TCMU_CMD_SET_FEATURES + 1,
 };
=20
 #define tcmu_cmd_set_dbi_cur(cmd, index) ((cmd)->dbi_cur =3D (index))
diff --git a/drivers/thermal/thermal_netlink.c b/drivers/thermal/thermal_ne=
tlink.c
index 050d243a5fa1..e2d78a996b5f 100644
--- a/drivers/thermal/thermal_netlink.c
+++ b/drivers/thermal/thermal_netlink.c
@@ -693,6 +693,7 @@ static struct genl_family thermal_gnl_family __ro_after=
_init =3D {
 =09.policy=09=09=3D thermal_genl_policy,
 =09.small_ops=09=3D thermal_genl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(thermal_genl_ops),
+=09.resv_start_op=09=3D THERMAL_GENL_CMD_CDEV_GET + 1,
 =09.mcgrps=09=09=3D thermal_genl_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(thermal_genl_mcgrps),
 };
diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index c06c02704461..7badf5777597 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -1183,6 +1183,7 @@ static struct genl_family vdpa_nl_family __ro_after_i=
nit =3D {
 =09.module =3D THIS_MODULE,
 =09.ops =3D vdpa_nl_ops,
 =09.n_ops =3D ARRAY_SIZE(vdpa_nl_ops),
+=09.resv_start_op =3D VDPA_CMD_DEV_VSTATS_GET + 1,
 };
=20
 static int vdpa_init(void)
diff --git a/fs/cifs/netlink.c b/fs/cifs/netlink.c
index 291cb606f149..147d9409252c 100644
--- a/fs/cifs/netlink.c
+++ b/fs/cifs/netlink.c
@@ -51,6 +51,7 @@ struct genl_family cifs_genl_family =3D {
 =09.policy=09=09=3D cifs_genl_policy,
 =09.ops=09=09=3D cifs_genl_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(cifs_genl_ops),
+=09.resv_start_op=09=3D CIFS_GENL_CMD_SWN_NOTIFY + 1,
 =09.mcgrps=09=09=3D cifs_genl_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(cifs_genl_mcgrps),
 };
diff --git a/fs/dlm/netlink.c b/fs/dlm/netlink.c
index 67f68d48d60c..4de4b8651c6c 100644
--- a/fs/dlm/netlink.c
+++ b/fs/dlm/netlink.c
@@ -75,6 +75,7 @@ static struct genl_family family __ro_after_init =3D {
 =09.version=09=3D DLM_GENL_VERSION,
 =09.small_ops=09=3D dlm_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(dlm_nl_ops),
+=09.resv_start_op=09=3D DLM_CMD_HELLO + 1,
 =09.module=09=09=3D THIS_MODULE,
 };
=20
diff --git a/fs/ksmbd/transport_ipc.c b/fs/ksmbd/transport_ipc.c
index 7cb0eeb07c80..c9aca21637d5 100644
--- a/fs/ksmbd/transport_ipc.c
+++ b/fs/ksmbd/transport_ipc.c
@@ -197,6 +197,7 @@ static struct genl_family ksmbd_genl_family =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.ops=09=09=3D ksmbd_genl_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(ksmbd_genl_ops),
+=09.resv_start_op=09=3D KSMBD_EVENT_SPNEGO_AUTHEN_RESPONSE + 1,
 };
=20
 static void ksmbd_nl_init_fixup(void)
diff --git a/include/linux/genl_magic_func.h b/include/linux/genl_magic_fun=
c.h
index 939b1a8f571b..4a4b387181ad 100644
--- a/include/linux/genl_magic_func.h
+++ b/include/linux/genl_magic_func.h
@@ -294,6 +294,7 @@ static struct genl_family ZZZ_genl_family __ro_after_in=
it =3D {
 =09.ops =3D ZZZ_genl_ops,
 =09.n_ops =3D ARRAY_SIZE(ZZZ_genl_ops),
 =09.mcgrps =3D ZZZ_genl_mcgrps,
+=09.resv_start_op =3D 42, /* drbd is currently the only user */
 =09.n_mcgrps =3D ARRAY_SIZE(ZZZ_genl_mcgrps),
 =09.module =3D THIS_MODULE,
 };
diff --git a/include/net/genetlink.h b/include/net/genetlink.h
index c41b20783ad0..8f780170e2f8 100644
--- a/include/net/genetlink.h
+++ b/include/net/genetlink.h
@@ -39,6 +39,8 @@ struct genl_info;
  *=09undo operations done by pre_doit, for example release locks
  * @mcgrps: multicast groups used by this family
  * @n_mcgrps: number of multicast groups
+ * @resv_start_op: first operation for which reserved fields of the header
+ *=09can be validated, new families should leave this field at zero
  * @mcgrp_offset: starting number of multicast group IDs in this family
  *=09(private)
  * @ops: the operations supported by this family
@@ -58,6 +60,7 @@ struct genl_family {
 =09u8=09=09=09n_ops;
 =09u8=09=09=09n_small_ops;
 =09u8=09=09=09n_mcgrps;
+=09u8=09=09=09resv_start_op;
 =09const struct nla_policy *policy;
 =09int=09=09=09(*pre_doit)(const struct genl_ops *ops,
 =09=09=09=09=09    struct sk_buff *skb,
diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index f7e246336218..8ce3fa0c19e2 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -688,6 +688,7 @@ static struct genl_family family __ro_after_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.ops=09=09=3D taskstats_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(taskstats_ops),
+=09.resv_start_op=09=3D CGROUPSTATS_CMD_GET + 1,
 =09.netnsok=09=3D true,
 };
=20
diff --git a/net/batman-adv/netlink.c b/net/batman-adv/netlink.c
index 00875e1d8c44..a5e4a4e976cf 100644
--- a/net/batman-adv/netlink.c
+++ b/net/batman-adv/netlink.c
@@ -1493,6 +1493,7 @@ struct genl_family batadv_netlink_family __ro_after_i=
nit =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D batadv_netlink_ops,
 =09.n_small_ops =3D ARRAY_SIZE(batadv_netlink_ops),
+=09.resv_start_op =3D BATADV_CMD_SET_VLAN + 1,
 =09.mcgrps =3D batadv_netlink_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(batadv_netlink_mcgrps),
 };
diff --git a/net/core/devlink.c b/net/core/devlink.c
index e0073981e92d..5011a825834e 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -9512,6 +9512,7 @@ static struct genl_family devlink_nl_family __ro_afte=
r_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D devlink_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(devlink_nl_ops),
+=09.resv_start_op=09=3D DEVLINK_CMD_SELFTESTS_RUN + 1,
 =09.mcgrps=09=09=3D devlink_nl_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(devlink_nl_mcgrps),
 };
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 876664fc605e..f084a4a6b7ab 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -1645,6 +1645,7 @@ static struct genl_family net_drop_monitor_family __r=
o_after_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D dropmon_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(dropmon_ops),
+=09.resv_start_op=09=3D NET_DM_CMD_STATS_GET + 1,
 =09.mcgrps=09=09=3D dropmon_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(dropmon_mcgrps),
 };
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 0ccb177aaf04..f4e41a6e0163 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -1036,6 +1036,7 @@ static struct genl_family ethtool_genl_family __ro_af=
ter_init =3D {
 =09.parallel_ops=09=3D true,
 =09.ops=09=09=3D ethtool_genl_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(ethtool_genl_ops),
+=09.resv_start_op=09=3D ETHTOOL_MSG_MODULE_GET + 1,
 =09.mcgrps=09=09=3D ethtool_nl_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(ethtool_nl_mcgrps),
 };
diff --git a/net/hsr/hsr_netlink.c b/net/hsr/hsr_netlink.c
index 1405c037cf7a..7174a9092900 100644
--- a/net/hsr/hsr_netlink.c
+++ b/net/hsr/hsr_netlink.c
@@ -522,6 +522,7 @@ static struct genl_family hsr_genl_family __ro_after_in=
it =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D hsr_ops,
 =09.n_small_ops =3D ARRAY_SIZE(hsr_ops),
+=09.resv_start_op =3D HSR_C_SET_NODE_LIST + 1,
 =09.mcgrps =3D hsr_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(hsr_mcgrps),
 };
diff --git a/net/ieee802154/netlink.c b/net/ieee802154/netlink.c
index b07abc38b4b3..7d2de4ee6992 100644
--- a/net/ieee802154/netlink.c
+++ b/net/ieee802154/netlink.c
@@ -132,6 +132,7 @@ struct genl_family nl802154_family __ro_after_init =3D =
{
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D ieee802154_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(ieee802154_ops),
+=09.resv_start_op=09=3D IEEE802154_LLSEC_DEL_SECLEVEL + 1,
 =09.mcgrps=09=09=3D ieee802154_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(ieee802154_mcgrps),
 };
diff --git a/net/ieee802154/nl802154.c b/net/ieee802154/nl802154.c
index e0b072aecf0f..38c4f3cb010e 100644
--- a/net/ieee802154/nl802154.c
+++ b/net/ieee802154/nl802154.c
@@ -2500,6 +2500,7 @@ static struct genl_family nl802154_fam __ro_after_ini=
t =3D {
 =09.module =3D THIS_MODULE,
 =09.ops =3D nl802154_ops,
 =09.n_ops =3D ARRAY_SIZE(nl802154_ops),
+=09.resv_start_op =3D NL802154_CMD_DEL_SEC_LEVEL + 1,
 =09.mcgrps =3D nl802154_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(nl802154_mcgrps),
 };
diff --git a/net/ipv4/fou.c b/net/ipv4/fou.c
index 025a33c1b04d..3e409bcca606 100644
--- a/net/ipv4/fou.c
+++ b/net/ipv4/fou.c
@@ -931,6 +931,7 @@ static struct genl_family fou_nl_family __ro_after_init=
 =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D fou_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(fou_nl_ops),
+=09.resv_start_op=09=3D FOU_CMD_GET + 1,
 };
=20
 size_t fou_encap_hlen(struct ip_tunnel_encap *e)
diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index d58e672be31c..82f4575f9cd9 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -969,6 +969,7 @@ static struct genl_family tcp_metrics_nl_family __ro_af=
ter_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D tcp_metrics_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(tcp_metrics_nl_ops),
+=09.resv_start_op=09=3D TCP_METRICS_CMD_DEL + 1,
 };
=20
 static unsigned int tcpmhash_entries;
diff --git a/net/ipv6/ila/ila_main.c b/net/ipv6/ila/ila_main.c
index 36c58aa257e8..3faf62530d6a 100644
--- a/net/ipv6/ila/ila_main.c
+++ b/net/ipv6/ila/ila_main.c
@@ -55,6 +55,7 @@ struct genl_family ila_nl_family __ro_after_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.ops=09=09=3D ila_nl_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(ila_nl_ops),
+=09.resv_start_op=09=3D ILA_CMD_FLUSH + 1,
 };
=20
 static __net_init int ila_init_net(struct net *net)
diff --git a/net/ipv6/ioam6.c b/net/ipv6/ioam6.c
index 1098131ed90c..571f0e4d9cf3 100644
--- a/net/ipv6/ioam6.c
+++ b/net/ipv6/ioam6.c
@@ -619,6 +619,7 @@ static struct genl_family ioam6_genl_family __ro_after_=
init =3D {
 =09.parallel_ops=09=3D true,
 =09.ops=09=09=3D ioam6_genl_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(ioam6_genl_ops),
+=09.resv_start_op=09=3D IOAM6_CMD_NS_SET_SCHEMA + 1,
 =09.module=09=09=3D THIS_MODULE,
 };
=20
diff --git a/net/ipv6/seg6.c b/net/ipv6/seg6.c
index 73aaabf0e966..5421cc7c935f 100644
--- a/net/ipv6/seg6.c
+++ b/net/ipv6/seg6.c
@@ -499,6 +499,7 @@ static struct genl_family seg6_genl_family __ro_after_i=
nit =3D {
 =09.parallel_ops=09=3D true,
 =09.ops=09=09=3D seg6_genl_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(seg6_genl_ops),
+=09.resv_start_op=09=3D SEG6_CMD_GET_TUNSRC + 1,
 =09.module=09=09=3D THIS_MODULE,
 };
=20
diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
index 96eb91be9238..a901fd14fe3b 100644
--- a/net/l2tp/l2tp_netlink.c
+++ b/net/l2tp/l2tp_netlink.c
@@ -989,6 +989,7 @@ static struct genl_family l2tp_nl_family __ro_after_ini=
t =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D l2tp_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(l2tp_nl_ops),
+=09.resv_start_op=09=3D L2TP_CMD_SESSION_GET + 1,
 =09.mcgrps=09=09=3D l2tp_multicast_group,
 =09.n_mcgrps=09=3D ARRAY_SIZE(l2tp_multicast_group),
 };
diff --git a/net/mptcp/pm_netlink.c b/net/mptcp/pm_netlink.c
index 291b5da42fdb..a3e4ee7af0ee 100644
--- a/net/mptcp/pm_netlink.c
+++ b/net/mptcp/pm_netlink.c
@@ -2280,6 +2280,7 @@ static struct genl_family mptcp_genl_family __ro_afte=
r_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D mptcp_pm_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(mptcp_pm_ops),
+=09.resv_start_op=09=3D MPTCP_PM_CMD_SUBFLOW_DESTROY + 1,
 =09.mcgrps=09=09=3D mptcp_pm_mcgrps,
 =09.n_mcgrps=09=3D ARRAY_SIZE(mptcp_pm_mcgrps),
 };
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index c189b4c8a182..d27f4eccce6d 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -768,6 +768,7 @@ static struct genl_family ncsi_genl_family __ro_after_i=
nit =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D ncsi_ops,
 =09.n_small_ops =3D ARRAY_SIZE(ncsi_ops),
+=09.resv_start_op =3D NCSI_CMD_SET_CHANNEL_MASK + 1,
 };
=20
 static int __init ncsi_init_netlink(void)
diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.=
c
index efab2b06d373..818b0b058b10 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -4005,6 +4005,7 @@ static struct genl_family ip_vs_genl_family __ro_afte=
r_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D ip_vs_genl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(ip_vs_genl_ops),
+=09.resv_start_op=09=3D IPVS_CMD_FLUSH + 1,
 };
=20
 static int __init ip_vs_genl_register(void)
diff --git a/net/netlabel/netlabel_calipso.c b/net/netlabel/netlabel_calips=
o.c
index 91a19c3ea1a3..f1d5b8465217 100644
--- a/net/netlabel/netlabel_calipso.c
+++ b/net/netlabel/netlabel_calipso.c
@@ -344,6 +344,7 @@ static struct genl_family netlbl_calipso_gnl_family __r=
o_after_init =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D netlbl_calipso_ops,
 =09.n_small_ops =3D ARRAY_SIZE(netlbl_calipso_ops),
+=09.resv_start_op =3D NLBL_CALIPSO_C_LISTALL + 1,
 };
=20
 /* NetLabel Generic NETLINK Protocol Functions
diff --git a/net/netlabel/netlabel_cipso_v4.c b/net/netlabel/netlabel_cipso=
_v4.c
index 894e6b8f1a86..fa08ee75ac06 100644
--- a/net/netlabel/netlabel_cipso_v4.c
+++ b/net/netlabel/netlabel_cipso_v4.c
@@ -767,6 +767,7 @@ static struct genl_family netlbl_cipsov4_gnl_family __r=
o_after_init =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D netlbl_cipsov4_ops,
 =09.n_small_ops =3D ARRAY_SIZE(netlbl_cipsov4_ops),
+=09.resv_start_op =3D NLBL_CIPSOV4_C_LISTALL + 1,
 };
=20
 /*
diff --git a/net/netlabel/netlabel_mgmt.c b/net/netlabel/netlabel_mgmt.c
index 032b7d7b32c7..689eaa2afbec 100644
--- a/net/netlabel/netlabel_mgmt.c
+++ b/net/netlabel/netlabel_mgmt.c
@@ -826,6 +826,7 @@ static struct genl_family netlbl_mgmt_gnl_family __ro_a=
fter_init =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D netlbl_mgmt_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(netlbl_mgmt_genl_ops),
+=09.resv_start_op =3D NLBL_MGMT_C_VERSION + 1,
 };
=20
 /*
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index 0555dffd80e0..9996883bf2b7 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -1374,6 +1374,7 @@ static struct genl_family netlbl_unlabel_gnl_family _=
_ro_after_init =3D {
 =09.module =3D THIS_MODULE,
 =09.small_ops =3D netlbl_unlabel_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(netlbl_unlabel_genl_ops),
+=09.resv_start_op =3D NLBL_UNLABEL_C_STATICLISTDEF + 1,
 };
=20
 /*
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 57010927e20a..a1a7b2d7738e 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -757,6 +757,9 @@ static int genl_family_rcv_msg(const struct genl_family=
 *family,
 =09if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
 =09=09return -EINVAL;
=20
+=09if (hdr->cmd >=3D family->resv_start_op && hdr->reserved)
+=09=09return -EINVAL;
+
 =09if (genl_get_cmd(hdr->cmd, family, &op))
 =09=09return -EOPNOTSUPP;
=20
@@ -1348,6 +1351,7 @@ static struct genl_family genl_ctrl __ro_after_init =
=3D {
 =09.module =3D THIS_MODULE,
 =09.ops =3D genl_ctrl_ops,
 =09.n_ops =3D ARRAY_SIZE(genl_ctrl_ops),
+=09.resv_start_op =3D CTRL_CMD_GETPOLICY + 1,
 =09.mcgrps =3D genl_ctrl_groups,
 =09.n_mcgrps =3D ARRAY_SIZE(genl_ctrl_groups),
 =09.id =3D GENL_ID_CTRL,
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 7c62417ccfd7..9d91087b9399 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1783,6 +1783,7 @@ static struct genl_family nfc_genl_family __ro_after_=
init =3D {
 =09.module =3D THIS_MODULE,
 =09.ops =3D nfc_genl_ops,
 =09.n_ops =3D ARRAY_SIZE(nfc_genl_ops),
+=09.resv_start_op =3D NFC_CMD_DEACTIVATE_TARGET + 1,
 =09.mcgrps =3D nfc_genl_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(nfc_genl_mcgrps),
 };
diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index 4e70df91d0f2..48e8f5c29b67 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -2283,6 +2283,7 @@ struct genl_family dp_ct_limit_genl_family __ro_after=
_init =3D {
 =09.parallel_ops =3D true,
 =09.small_ops =3D ct_limit_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(ct_limit_genl_ops),
+=09.resv_start_op =3D OVS_CT_LIMIT_CMD_GET + 1,
 =09.mcgrps =3D &ovs_ct_limit_multicast_group,
 =09.n_mcgrps =3D 1,
 =09.module =3D THIS_MODULE,
diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 45f9a7b3410e..1d6397eaadf0 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -692,6 +692,7 @@ static struct genl_family dp_packet_genl_family __ro_af=
ter_init =3D {
 =09.parallel_ops =3D true,
 =09.small_ops =3D dp_packet_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(dp_packet_genl_ops),
+=09.resv_start_op =3D OVS_PACKET_CMD_EXECUTE + 1,
 =09.module =3D THIS_MODULE,
 };
=20
@@ -1509,6 +1510,7 @@ static struct genl_family dp_flow_genl_family __ro_af=
ter_init =3D {
 =09.parallel_ops =3D true,
 =09.small_ops =3D dp_flow_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(dp_flow_genl_ops),
+=09.resv_start_op =3D OVS_FLOW_CMD_SET + 1,
 =09.mcgrps =3D &ovs_dp_flow_multicast_group,
 =09.n_mcgrps =3D 1,
 =09.module =3D THIS_MODULE,
@@ -2040,6 +2042,7 @@ static struct genl_family dp_datapath_genl_family __r=
o_after_init =3D {
 =09.parallel_ops =3D true,
 =09.small_ops =3D dp_datapath_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(dp_datapath_genl_ops),
+=09.resv_start_op =3D OVS_DP_CMD_SET + 1,
 =09.mcgrps =3D &ovs_dp_datapath_multicast_group,
 =09.n_mcgrps =3D 1,
 =09.module =3D THIS_MODULE,
diff --git a/net/openvswitch/meter.c b/net/openvswitch/meter.c
index 04a060ac7fdf..51111a9009bd 100644
--- a/net/openvswitch/meter.c
+++ b/net/openvswitch/meter.c
@@ -720,6 +720,7 @@ struct genl_family dp_meter_genl_family __ro_after_init=
 =3D {
 =09.parallel_ops =3D true,
 =09.small_ops =3D dp_meter_genl_ops,
 =09.n_small_ops =3D ARRAY_SIZE(dp_meter_genl_ops),
+=09.resv_start_op =3D OVS_METER_CMD_GET + 1,
 =09.mcgrps =3D &ovs_meter_multicast_group,
 =09.n_mcgrps =3D 1,
 =09.module =3D THIS_MODULE,
diff --git a/net/psample/psample.c b/net/psample/psample.c
index 118d5d2a81a0..81a794e36f53 100644
--- a/net/psample/psample.c
+++ b/net/psample/psample.c
@@ -115,6 +115,7 @@ static struct genl_family psample_nl_family __ro_after_=
init =3D {
 =09.mcgrps=09=09=3D psample_nl_mcgrps,
 =09.small_ops=09=3D psample_nl_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(psample_nl_ops),
+=09.resv_start_op=09=3D PSAMPLE_CMD_GET_GROUP + 1,
 =09.n_mcgrps=09=3D ARRAY_SIZE(psample_nl_mcgrps),
 };
=20
diff --git a/net/smc/smc_netlink.c b/net/smc/smc_netlink.c
index c5a62f6f52ba..621c46c70073 100644
--- a/net/smc/smc_netlink.c
+++ b/net/smc/smc_netlink.c
@@ -142,7 +142,8 @@ struct genl_family smc_gen_nl_family __ro_after_init =
=3D {
 =09.netnsok =3D=09true,
 =09.module =3D=09THIS_MODULE,
 =09.ops =3D=09=09smc_gen_nl_ops,
-=09.n_ops =3D=09ARRAY_SIZE(smc_gen_nl_ops)
+=09.n_ops =3D=09ARRAY_SIZE(smc_gen_nl_ops),
+=09.resv_start_op =3D SMC_NETLINK_DISABLE_HS_LIMITATION + 1,
 };
=20
 int __init smc_nl_init(void)
diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index 4c3bf6db7038..25fb2fd186e2 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -715,7 +715,8 @@ static struct genl_family smc_pnet_nl_family __ro_after=
_init =3D {
 =09.netnsok =3D true,
 =09.module =3D THIS_MODULE,
 =09.ops =3D smc_pnet_ops,
-=09.n_ops =3D  ARRAY_SIZE(smc_pnet_ops)
+=09.n_ops =3D  ARRAY_SIZE(smc_pnet_ops),
+=09.resv_start_op =3D SMC_PNETID_FLUSH + 1,
 };
=20
 bool smc_pnet_is_ndev_pnetid(struct net *net, u8 *pnetid)
diff --git a/net/tipc/netlink.c b/net/tipc/netlink.c
index c447cb5f879e..e8fd257c0e68 100644
--- a/net/tipc/netlink.c
+++ b/net/tipc/netlink.c
@@ -294,6 +294,7 @@ struct genl_family tipc_genl_family __ro_after_init =3D=
 {
 =09.module=09=09=3D THIS_MODULE,
 =09.ops=09=09=3D tipc_genl_v2_ops,
 =09.n_ops=09=09=3D ARRAY_SIZE(tipc_genl_v2_ops),
+=09.resv_start_op=09=3D TIPC_NL_ADDR_LEGACY_GET + 1,
 };
=20
 int __init tipc_netlink_start(void)
diff --git a/net/tipc/netlink_compat.c b/net/tipc/netlink_compat.c
index 0749df80454d..fc68733673ba 100644
--- a/net/tipc/netlink_compat.c
+++ b/net/tipc/netlink_compat.c
@@ -1357,6 +1357,7 @@ static struct genl_family tipc_genl_compat_family __r=
o_after_init =3D {
 =09.module=09=09=3D THIS_MODULE,
 =09.small_ops=09=3D tipc_genl_compat_ops,
 =09.n_small_ops=09=3D ARRAY_SIZE(tipc_genl_compat_ops),
+=09.resv_start_op=09=3D TIPC_GENL_CMD + 1,
 };
=20
 int __init tipc_netlink_compat_start(void)
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2705e3ee8fc4..58c29b52d48b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17141,6 +17141,7 @@ static struct genl_family nl80211_fam __ro_after_in=
it =3D {
 =09.n_ops =3D ARRAY_SIZE(nl80211_ops),
 =09.small_ops =3D nl80211_small_ops,
 =09.n_small_ops =3D ARRAY_SIZE(nl80211_small_ops),
+=09.resv_start_op =3D NL80211_CMD_REMOVE_LINK_STA + 1,
 =09.mcgrps =3D nl80211_mcgrps,
 =09.n_mcgrps =3D ARRAY_SIZE(nl80211_mcgrps),
 =09.parallel_ops =3D true,
--=20
2.37.2

