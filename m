Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C2F101B7CA0
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 19:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587749107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mk9/I7WNC0MuRckysmybbk0tBbhs46knEr/MKZPIqm0=;
	b=Zty95kZh1YzIDV/boyHroC00Ncx0dxuT0Q7tvFoIpZIqjoJ20b0zMQSxQ4ONKeL2Gq34p+
	RSHZpmG34vfBuLbs2z0zV+4b47YRzpy90wGa4DpXPAkbIGurNz37YejIuRZOYrc00rHbhD
	0PGsNWzI/vnxKAexqEdxHxx0P+JaqQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-J3LoPNa3Mu63GIpfzqMMxQ-1; Fri, 24 Apr 2020 13:25:05 -0400
X-MC-Unique: J3LoPNa3Mu63GIpfzqMMxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95CFB802EAC;
	Fri, 24 Apr 2020 17:25:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A3D2618B;
	Fri, 24 Apr 2020 17:25:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 544A1180954D;
	Fri, 24 Apr 2020 17:25:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OHOwWm020698 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 13:24:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6FBDD9080; Fri, 24 Apr 2020 17:24:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-238.phx2.redhat.com [10.3.112.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 232F1605D1;
	Fri, 24 Apr 2020 17:24:58 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 24 Apr 2020 12:24:55 -0500
Message-Id: <20200424172456.616586-4-rpeterso@redhat.com>
In-Reply-To: <20200424172456.616586-1-rpeterso@redhat.com>
References: <20200424172456.616586-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/4] gfs2: Fix BUG during unmount after
	file system withdraw
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, when the logd daemon was forced to withdraw, it
would try to request its journal be recovered by another cluster node.
However, in single-user cases with lock_nolock, there are no other
nodes to recover the journal. Function signal_our_withdraw() was
recognizing the lock_nolock situation, but not until after it had
evicted its journal inode. Since the journal descriptor that points
to the inode was never removed from the master list, when the unmount
occurred, it did another iput on the evicted inode, which resulted in
a BUG from fs/inode.c (BUG_ON(inode->i_state & I_CLEAR);).

This patch moves the check for this situation earlier in function
signal_our_withdraw(), which avoids the extra iput, so the unmount
may happen normally.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 9b64d40ab379..aa087a5675af 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -119,6 +119,12 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09if (!sb_rdonly(sdp->sd_vfs))
 =09=09ret =3D gfs2_make_fs_ro(sdp);
=20
+=09if (sdp->sd_lockstruct.ls_ops->lm_lock =3D=3D NULL) { /* lock_nolock */
+=09=09if (!ret)
+=09=09=09ret =3D -EIO;
+=09=09clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+=09=09goto skip_recovery;
+=09}
 =09/*
 =09 * Drop the glock for our journal so another node can recover it.
 =09 */
@@ -159,10 +165,6 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09=09wait_on_bit(&gl->gl_flags, GLF_FREEING, TASK_UNINTERRUPTIBLE);
 =09}
=20
-=09if (sdp->sd_lockstruct.ls_ops->lm_lock =3D=3D NULL) { /* lock_nolock */
-=09=09clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
-=09=09goto skip_recovery;
-=09}
 =09/*
 =09 * Dequeue the "live" glock, but keep a reference so it's never freed.
 =09 */
--=20
2.25.1

