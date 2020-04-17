Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 480691ADFD4
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Apr 2020 16:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587133664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PVScJQ7q7U4kWQEFW3KtSWbFm6U+P58kRmZMEE7DMLE=;
	b=FwLWOzajcRhTRUf/Aw92wU+sueY8MCS4mbcjKInj4czCxVs2E/lZ0BrUgdUVKUdV2D7ZFe
	fG1teTtStpl9HPp+0fYYggCX688iiUflu7mJKw7Js+TmVP87MbASj7s+c/c+GS6S12/YbF
	6Cptgia6xJj7O1gIMhZD5dD536cKNX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-dBsfBZMAMIGkX3e7Opj2RQ-1; Fri, 17 Apr 2020 10:27:42 -0400
X-MC-Unique: dBsfBZMAMIGkX3e7Opj2RQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35B8C1137846;
	Fri, 17 Apr 2020 14:27:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91661001DD8;
	Fri, 17 Apr 2020 14:27:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2535E93512;
	Fri, 17 Apr 2020 14:27:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HERWx8001232 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 10:27:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E166119C70; Fri, 17 Apr 2020 14:27:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.193.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E59D19C69;
	Fri, 17 Apr 2020 14:27:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>
Date: Fri, 17 Apr 2020 16:27:26 +0200
Message-Id: <20200417142726.188190-1-agruenba@redhat.com>
In-Reply-To: <1706994570.22510265.1587128956368.JavaMail.zimbra@redhat.com>
References: <202004171521.Z9s8gKSV%lkp@intel.com>
	<CAHc6FU43LpVbPEEq29cDkJ5X2t=6qACfoETw15QZX1CHKqPUbQ@mail.gmail.com>
	<1706994570.22510265.1587128956368.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [gfs2:gfs2-iopen 12/12] fs/gfs2/util.c:126:3:
	error: implicit declaration of function
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Fri, Apr 17, 2020 at 3:09 PM Bob Peterson <rpeterso@redhat.com> wrote:
> ----- Original Message -----
> > Bob,
> >
> > commit "gfs2: Force withdraw to replay journals and wait for it to
> > finish" adds three new users of gfs2_glock_dq_wait in function
> > signal_our_withdraw. Is the waiting there done for a reason, or can we
> > replace gfs2_glock_dq_wait with gfs2_glock_dq / gfs2_glock_dq_uninit
> > in that function?
> >
> > Thanks,
> > Andreas
>
> Hi Andreas,
>
> I remember debugging cases in which we needed to wait.
> When we didn't wait for glocks to be demoted, the node just reacquired
> the glocks again too quickly, before other nodes could attempt recovery.
> When the withdrawing node tried to reacquire them, DLM simply granted
> them on the same node, which is the only node that must not do recovery.
>
> Addressing each instance separately:
>
> (1) We would dequeue our journal glock, then dequeue the live glock.
>     The other nodes would see the callback for the "live" glock and
>     attempt recovery, however they were denied access to the journal
>     glock because it was still held on the recovering node. That's
>     because the glock state machine (but more importantly the dlm)
>     had not yet demoted the lock completely when this took place.
>     So none of the nodes performed recovery.

Hmm, sdp->sd_journal_gh has the GL_NOCACHE flag set, so the demote
should happen immediately.  On the other hand, sdp->sd_live_gh doesn't
have that flag set, so that may be the actual problem here.

> (2) We might be able to get rid of the "wait" for the "live" glock.
>     I can't think of a case in which that would behave badly, but
>     bear in mind it's been more than a year since I originally wrote
>     that. It's probably closer to 2 years now.
> (3) We might be able to get rid of the third "wait" which is also for
>     the "live" glock. I don't remember the circumstances.
>
> TBH, I wouldn't feel comfortable getting rid of any of those waits
> until I do some heavy experimentation on my 5-node cluster with the
> recovery tests.

I agree that testing will be needed.  What do you think of the below
patch?

Thanks,
Andreas

---
 fs/gfs2/ops_fstype.c |  2 +-
 fs/gfs2/util.c       | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index e2b69ffcc6a8..98b2577b815b 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -405,7 +405,7 @@ static int init_locking(struct gfs2_sbd *sdp, struct gf=
s2_holder *mount_gh,
 =09error =3D gfs2_glock_nq_num(sdp,
 =09=09=09=09  GFS2_LIVE_LOCK, &gfs2_nondisk_glops,
 =09=09=09=09  LM_ST_SHARED,
-=09=09=09=09  LM_FLAG_NOEXP | GL_EXACT,
+=09=09=09=09  LM_FLAG_NOEXP | GL_EXACT | GL_NOCACHE,
 =09=09=09=09  &sdp->sd_live_gh);
 =09if (error) {
 =09=09fs_err(sdp, "can't acquire live glock: %d\n", error);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 9b64d40ab379..6e48cef79c53 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -122,10 +122,8 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09/*
 =09 * Drop the glock for our journal so another node can recover it.
 =09 */
-=09if (gfs2_holder_initialized(&sdp->sd_journal_gh)) {
-=09=09gfs2_glock_dq_wait(&sdp->sd_journal_gh);
-=09=09gfs2_holder_uninit(&sdp->sd_journal_gh);
-=09}
+=09if (gfs2_holder_initialized(&sdp->sd_journal_gh))
+=09=09gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
 =09sdp->sd_jinode_gh.gh_flags |=3D GL_NOCACHE;
 =09gfs2_glock_dq(&sdp->sd_jinode_gh);
 =09if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
@@ -167,7 +165,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09 * Dequeue the "live" glock, but keep a reference so it's never freed.
 =09 */
 =09gfs2_glock_hold(gl);
-=09gfs2_glock_dq_wait(&sdp->sd_live_gh);
+=09gfs2_glock_dq(&sdp->sd_live_gh);
 =09/*
 =09 * We enqueue the "live" glock in EX so that all other nodes
 =09 * get a demote request and act on it. We don't really want the
@@ -175,7 +173,8 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09 */
 =09fs_warn(sdp, "Requesting recovery of jid %d.\n",
 =09=09sdp->sd_lockstruct.ls_jid);
-=09gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY_1CB | LM_FLAG_NOEXP,
+=09gfs2_holder_reinit(LM_ST_EXCLUSIVE,
+=09=09=09   LM_FLAG_TRY_1CB | LM_FLAG_NOEXP | GL_NOCACHE,
 =09=09=09   &sdp->sd_live_gh);
 =09msleep(GL_GLOCK_MAX_HOLD);
 =09/*
@@ -199,8 +198,9 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09=09if (gfs2_recover_journal(sdp->sd_jdesc, 1))
 =09=09=09fs_warn(sdp, "Unable to recover our journal jid %d.\n",
 =09=09=09=09sdp->sd_lockstruct.ls_jid);
-=09=09gfs2_glock_dq_wait(&sdp->sd_live_gh);
-=09=09gfs2_holder_reinit(LM_ST_SHARED, LM_FLAG_NOEXP | GL_EXACT,
+=09=09gfs2_glock_dq(&sdp->sd_live_gh);
+=09=09gfs2_holder_reinit(LM_ST_SHARED,
+=09=09=09=09   LM_FLAG_NOEXP | GL_EXACT | GL_NOCACHE,
 =09=09=09=09   &sdp->sd_live_gh);
 =09=09gfs2_glock_nq(&sdp->sd_live_gh);
 =09}

base-commit: bd437e630fee648b79999e617d48bb07ae76f8eb
prerequisite-patch-id: e3b7fbfc1e67b4065cb6c928c29c7ed8bee0fc1c
prerequisite-patch-id: 35e9388872b2d6ffc70c4fc5497d3fdec97d6392
--=20
2.25.2

