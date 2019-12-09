Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E2BAE117095
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4ogiOOeU8E9td6L+a8t+YaneQWn3TQ7WiGRJH8qwE9w=;
	b=dl/HT5IAFRzA9w0+0DCWZ+Cd8kRYFua4T02DQl1VLkeO+KlG7Gi2mxXvBU4AP07UE/C3eT
	tPVAasfuerjKx5sw7+F3GDYrZQLIvcV59TVv/6u/nDd4ECfua1fLXGmLKpc8DadWM0cCGi
	cm1jeAh8eJATL1p5IxIrI3FyVUYmQ1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-enPLqvz7NZi-65XDx1LiRw-1; Mon, 09 Dec 2019 10:37:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29AA0CF08F;
	Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 170336BF9F;
	Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0B1D83548;
	Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb5tO004869 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C3A95D9D6; Mon,  9 Dec 2019 15:37:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 485E85DA75
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:05 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:42 -0600
Message-Id: <20191209153700.700208-5-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 04/22] gfs2: log error reform
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: enPLqvz7NZi-65XDx1LiRw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
index 5dc889dae01f..58321a0a424a 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -107,8 +107,7 @@ __acquires(&sdp->sd_ail_lock)
=20
 =09=09if (!buffer_busy(bh)) {
 =09=09=09if (!buffer_uptodate(bh) &&
-=09=09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR,
-=09=09=09=09=09      &sdp->sd_flags)) {
+=09=09=09    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09=09} else {
@@ -208,10 +207,19 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp,=
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

