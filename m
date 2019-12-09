Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 48DB611709D
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZGy8yM30HXTfi/oRVqPpQAYaPa2JQV6kxb7yWhhyAII=;
	b=KI49GuN7xZPePCh2Cj2+2uUM5D4Vatd1iMj8SDjrA7efrsrM+PzsTpdJk3JNpKycIx65Vl
	qGjsc50/19ANk/7aCX0xjmvPgnmWhpuaYswogSgxxf4WTnm8tveU8KuYPFbjaDb6/DuAxE
	S/N8cm+PBhMmuIcKbs6Q8XWpXyBiiXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-yRiAzhZTPfyLDO_U3q5qXw-1; Mon, 09 Dec 2019 10:37:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31A08CF091;
	Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21ABE5C240;
	Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 021B61803C32;
	Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb6Mv004880 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3195B5DA75; Mon,  9 Dec 2019 15:37:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F29C55D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:05 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:44 -0600
Message-Id: <20191209153700.700208-7-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 06/22] gfs2: Ignore dlm recovery
	requests if gfs2 is withdrawn
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: yRiAzhZTPfyLDO_U3q5qXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When a node fails, user space informs dlm of the node failure,
and dlm instructs gfs2 on the surviving nodes to perform journal
recovery. It does this by calling various callback functions in
lock_dlm.c. To mark its progress, it keeps generation numbers
and recover bits in a dlm "control" lock lvb, which is seen by
all nodes to determine which journals need to be replayed.

The gfs2 on all nodes get the same recovery requests from dlm,
so they all try to do the recovery, but only one will be
granted the exclusive lock on the journal. The others fail
with a "Busy" message on their "try lock."

However, when a node is withdrawn, it cannot safely do any
recovery or safely replay any journals. To make matters worse,
gfs2 might withdraw as a result of attempting recovery. For
example, this might happen if the device goes offline, or if
an hba fails. But in today's gfs2 code, it doesn't check for
being withdrawn at any step in the recovery process. What's
worse if that these callbacks from dlm have no return code,
so there is no way to indicate failure back to dlm. We can
send a "Recovery failed" uevent eventually, but that tells
user space what happened, not dlm's kernel code.

Before this patch, lock_dlm would perform its recovery steps but
ignore the result, and eventually it would still update its
generation number in the lvb, despite the fact that it may have
withdrawn or encountered an error. The other nodes would then
see the newer generation number in the lvb and conclude that
they don't need to do recovery because the generation number
is newer than the last one they saw. They think a different
node has already recovered the journal.

This patch adds checks to several of the callbacks used by dlm
in its recovery state machine so that the functions are ignored
and skipped if an io error has occurred or if the file system
is withdrawn. That prevents the lvb bits from being updated, and
therefore dlm and user space still see the need for recovery to
take place.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lock_dlm.c | 18 ++++++++++++++++++
 fs/gfs2/recovery.c |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 7c7197343ee2..57fdf53d2246 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1079,6 +1079,10 @@ static void gdlm_recover_prep(void *arg)
 =09struct gfs2_sbd *sdp =3D arg;
 =09struct lm_lockstruct *ls =3D &sdp->sd_lockstruct;
=20
+=09if (gfs2_withdrawn(sdp)) {
+=09=09fs_err(sdp, "recover_prep ignored due to withdraw.\n");
+=09=09return;
+=09}
 =09spin_lock(&ls->ls_recover_spin);
 =09ls->ls_recover_block =3D ls->ls_recover_start;
 =09set_bit(DFL_DLM_RECOVERY, &ls->ls_recover_flags);
@@ -1101,6 +1105,11 @@ static void gdlm_recover_slot(void *arg, struct dlm_=
slot *slot)
 =09struct lm_lockstruct *ls =3D &sdp->sd_lockstruct;
 =09int jid =3D slot->slot - 1;
=20
+=09if (gfs2_withdrawn(sdp)) {
+=09=09fs_err(sdp, "recover_slot jid %d ignored due to withdraw.\n",
+=09=09       jid);
+=09=09return;
+=09}
 =09spin_lock(&ls->ls_recover_spin);
 =09if (ls->ls_recover_size < jid + 1) {
 =09=09fs_err(sdp, "recover_slot jid %d gen %u short size %d\n",
@@ -1125,6 +1134,10 @@ static void gdlm_recover_done(void *arg, struct dlm_=
slot *slots, int num_slots,
 =09struct gfs2_sbd *sdp =3D arg;
 =09struct lm_lockstruct *ls =3D &sdp->sd_lockstruct;
=20
+=09if (gfs2_withdrawn(sdp)) {
+=09=09fs_err(sdp, "recover_done ignored due to withdraw.\n");
+=09=09return;
+=09}
 =09/* ensure the ls jid arrays are large enough */
 =09set_recover_size(sdp, slots, num_slots);
=20
@@ -1152,6 +1165,11 @@ static void gdlm_recovery_result(struct gfs2_sbd *sd=
p, unsigned int jid,
 {
 =09struct lm_lockstruct *ls =3D &sdp->sd_lockstruct;
=20
+=09if (gfs2_withdrawn(sdp)) {
+=09=09fs_err(sdp, "recovery_result jid %d ignored due to withdraw.\n",
+=09=09       jid);
+=09=09return;
+=09}
 =09if (test_bit(DFL_NO_DLM_OPS, &ls->ls_recover_flags))
 =09=09return;
=20
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 85f830e56945..f1762f2daf50 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -306,6 +306,11 @@ void gfs2_recover_func(struct work_struct *work)
 =09int jlocked =3D 0;
=20
 =09t_start =3D ktime_get();
+=09if (gfs2_withdrawn(sdp)) {
+=09=09fs_err(sdp, "jid=3D%u: Recovery not attempted due to withdraw.\n",
+=09=09       jd->jd_jid);
+=09=09goto fail;
+=09}
 =09if (sdp->sd_args.ar_spectator)
 =09=09goto fail;
 =09if (jd->jd_jid !=3D sdp->sd_lockstruct.ls_jid) {
--=20
2.23.0

