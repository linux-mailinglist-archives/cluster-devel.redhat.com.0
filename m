Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 068A1FBABB
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aSa+23NNRuaixIX72HVpBZvqFElGV62upRttkuz7jOQ=;
	b=All7z+OCVO0KcQGJFVgGHml7inA9VjSt8YPMM+oLjPjxQuaYmHE/3ujZzasJqAfu6j7QoH
	1H/ajQ7I9cOf0L0qkbX/CXJDRdzy9KFPyVvFT+LDa8eHXzyoGQlFrSlBGefQ1Q/r2JuNgf
	eden764txYBktnCzdtI4gQmjwfFq/bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-j6C2FulpO0md4C1I8XQjMg-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2394A189DC03;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDC75C1BB;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAD0318034EF;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUaSc005204 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C4D96973B; Wed, 13 Nov 2019 21:30:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC90069739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:35 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:03 -0600
Message-Id: <20191113213030.237431-6-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/32] gfs2: log error reform
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
X-MC-Unique: j6C2FulpO0md4C1I8XQjMg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, gfs2 kept track of journal io errors in two
places sd_log_error and the SDF_AIL1_IO_ERROR flag in sd_flags.
This patch consolidates the two into sd_log_error so that it
reflects the first error encountered writing to the journal.
In future patches, we will take advantage of this by checking
this value rather than having to check both when reacting to
io errors.

In addition, this fixes a tight loop in unmount: If buffers
get on the ail1 list and an io error occurs elsewhere, the
ail1 list would never be cleared because they were always busy.
So unmount would hang, waiting for the ail1 list to empty.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  7 +++----
 fs/gfs2/log.c    | 16 ++++++++++++----
 fs/gfs2/quota.c  |  2 +-
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 9a50235567f4..d37698502d5d 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -616,9 +616,8 @@ enum {
 =09SDF_RORECOVERY=09=09=3D 7, /* read only recovery */
 =09SDF_SKIP_DLM_UNLOCK=09=3D 8,
 =09SDF_FORCE_AIL_FLUSH     =3D 9,
-=09SDF_AIL1_IO_ERROR=09=3D 10,
-=09SDF_FS_FROZEN           =3D 11,
-=09SDF_WITHDRAWING=09=09=3D 12, /* Will withdraw eventually */
+=09SDF_FS_FROZEN           =3D 10,
+=09SDF_WITHDRAWING=09=09=3D 11, /* Will withdraw eventually */
 };
=20
 enum gfs2_freeze_state {
@@ -828,7 +827,7 @@ struct gfs2_sbd {
 =09atomic_t sd_log_in_flight;
 =09struct bio *sd_log_bio;
 =09wait_queue_head_t sd_log_flush_wait;
-=09int sd_log_error;
+=09int sd_log_error; /* First log error */
=20
 =09atomic_t sd_reserving_log;
 =09wait_queue_head_t sd_reserving_log_wait;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6d6013c05e05..e8b1a7a2341b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -105,8 +105,7 @@ __acquires(&sdp->sd_ail_lock)
=20
 =09=09if (!buffer_busy(bh)) {
 =09=09=09if (!buffer_uptodate(bh) &&
-=09=09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR,
-=09=09=09=09=09      &sdp->sd_flags)) {
+=09=09=09    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09=09} else {
@@ -206,10 +205,19 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp,=
 struct gfs2_trans *tr)
 =09=09=09=09=09 bd_ail_st_list) {
 =09=09bh =3D bd->bd_bh;
 =09=09gfs2_assert(sdp, bd->bd_tr =3D=3D tr);
-=09=09if (buffer_busy(bh))
+=09=09/*
+=09=09 * If another process flagged an io error, e.g. writing to the
+=09=09 * journal, error all other bhs and move them off the ail1 to
+=09=09 * prevent a tight loop when unmount tries to flush ail1,
+=09=09 * regardless of whether they're still busy. If no outside
+=09=09 * errors were found and the buffer is busy, move to the next.
+=09=09 * If the ail buffer is not busy and caught an error, flag it
+=09=09 * for others.
+=09=09 */
+=09=09if (!sdp->sd_log_error && buffer_busy(bh))
 =09=09=09continue;
 =09=09if (!buffer_uptodate(bh) &&
-=09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
+=09=09    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 =09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09}
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index e9f93045eb01..ca2194cfa38e 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1477,7 +1477,7 @@ static void quotad_error(struct gfs2_sbd *sdp, const =
char *msg, int error)
 =09=09return;
 =09if (!gfs2_withdrawn(sdp)) {
 =09=09fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
-=09=09sdp->sd_log_error =3D error;
+=09=09cmpxchg(&sdp->sd_log_error, 0, error);
 =09=09wake_up(&sdp->sd_logd_waitq);
 =09}
 }
--=20
2.23.0

