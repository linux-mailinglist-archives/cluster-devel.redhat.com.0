Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 232E81BDBC8
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Apr 2020 14:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588162586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iI5RO6t+dRZn3d4SYZnfWtKBByekY4m/P2fcZws6Lxs=;
	b=FjZ8ngrbv6jcP+FwL+1HpS4QwUNLUoNjzQqCmcEL9rIpvN5XlG/RlvLbPcVw6zhLgLmXGK
	icARolbnwS/2NN+PI4rSctzemXrdYDQIpukLGYMZl9Xh0r2DjTXbBM9C8ZHowCd9ZEHS/x
	/BNHudx30Vye3zzG3RrbqN+LGFLVwz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-kxd0v3xwMueFs3ebfLf16A-1; Wed, 29 Apr 2020 08:16:23 -0400
X-MC-Unique: kxd0v3xwMueFs3ebfLf16A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B8AF6EED2;
	Wed, 29 Apr 2020 12:16:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 612035D748;
	Wed, 29 Apr 2020 12:16:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E92BF1809542;
	Wed, 29 Apr 2020 12:16:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TCGFKl031678 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 08:16:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 879291033C46; Wed, 29 Apr 2020 12:16:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 839C8103D207
	for <cluster-devel@redhat.com>; Wed, 29 Apr 2020 12:16:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78AA41049840
	for <cluster-devel@redhat.com>; Wed, 29 Apr 2020 12:16:12 +0000 (UTC)
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
	[216.71.145.155]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-276-5O3rTUq5PnuYK5nyuulBlg-1; Wed, 29 Apr 2020 08:16:10 -0400
X-MC-Unique: 5O3rTUq5PnuYK5nyuulBlg-1
IronPort-SDR: Kcr1Zc1U8Vfk1004ZQtJec41k+W2mmWYJZKHwb69d23ImMaGoxV+fr4JDpCu7GvZ4DsFw1+Z1H
	Kl3EJe3rRzD+H1FmjJpCPT84lMhj9qfFXjZxsJCRR3hzgPzmxPyW+p5wrhayJAitB5NWOEg9DW
	noIGfS2FzZfEhQb68eFd6bJlqEOMx7Rcgk+HdR1Nb3rbaZS8PXYhjzH78jHwRJhB2VXb/lW6zU
	tS8/N7/ysIYiN/Ufy9jBLxZYUO3jEgMEfx0kMhgWaZugIJSorGtJucU57h5WsNF4ZuKgzYDpJ1
	Dxk=
X-SBRS: 2.7
X-MesageID: 16420137
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16420137"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <cluster-devel@redhat.com>
Date: Wed, 29 Apr 2020 13:15:41 +0100
Message-ID: <20200429121541.30802-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03TCGFKl031678
X-loop: cluster-devel@redhat.com
Cc: Mark.Syms@citrix.com
Subject: [Cluster-devel] [PATCH] dlm: Switch to using wait_event()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

We saw an issue in a production server on a customer deployment where
DLM 4.0.7 gets "stuck" and unable to join new lockspaces.

See - https://lists.clusterlabs.org/pipermail/users/2019-January/016054.htm=
l

This was forwarded off list to David Teigland who responded thusly.

"
Hi, thanks for the debugging info.  You've spent more time looking at
this than I have, but from a first glance it seems to me that the
initial problem (there may be multiple) is that in the kernel,
lockspace.c do_event() does not sensibly handle the ERESTARTSYS error
from wait_event_interruptible().  I think do_event() should continue
waiting for a uevent result from userspace until it gets one, because
the kernel can't do anything sensible until it gets that.

Dave
"

The previous attempt at fixing this was NAKed by Linus since it could
cause a busy-wait loop. Instead, just switch wait_event_interruptible()
to wait_event().

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 fs/dlm/lockspace.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index afb8340918b8..e93670ecfae5 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -197,8 +197,6 @@ static struct kset *dlm_kset;
=20
 static int do_uevent(struct dlm_ls *ls, int in)
 {
-=09int error;
-
 =09if (in)
 =09=09kobject_uevent(&ls->ls_kobj, KOBJ_ONLINE);
 =09else
@@ -209,20 +207,12 @@ static int do_uevent(struct dlm_ls *ls, int in)
 =09/* dlm_controld will see the uevent, do the necessary group management
 =09   and then write to sysfs to wake us */
=20
-=09error =3D wait_event_interruptible(ls->ls_uevent_wait,
-=09=09=09test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
+=09wait_event(ls->ls_uevent_wait,
+=09=09   test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
=20
-=09log_rinfo(ls, "group event done %d %d", error, ls->ls_uevent_result);
-
-=09if (error)
-=09=09goto out;
+=09log_rinfo(ls, "group event done %d", ls->ls_uevent_result);
=20
-=09error =3D ls->ls_uevent_result;
- out:
-=09if (error)
-=09=09log_error(ls, "group %s failed %d %d", in ? "join" : "leave",
-=09=09=09  error, ls->ls_uevent_result);
-=09return error;
+=09return ls->ls_uevent_result;
 }
=20
 static int dlm_uevent(struct kset *kset, struct kobject *kobj,
--=20
2.21.1


