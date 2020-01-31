Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 14D1414F1E0
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:07:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VaMpAKtSXVrRhYWeS0X9R+nkVIXD++YkAypuc5jPzzo=;
	b=M6+lSTneWauAD+UBA9o4v5F8VKkC+Jm3M50R/wb9Xh43fBXH6SnA+nkUb4LVDBtJ80pgC7
	G+BcMA9ymd/kHkFWVHC9RConnL3lehmS2gwNMKsomykGTNQb6BbtzYGBl38EPjq6GjYSJo
	yTQAhgxJUim8/fhLT2YExBTAPcZiu9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-iI_xUJonPDeuZeqHyT8bBg-1; Fri, 31 Jan 2020 13:07:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E982F10B9F2A;
	Fri, 31 Jan 2020 18:07:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4FD1811E3;
	Fri, 31 Jan 2020 18:07:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBBAF18089C8;
	Fri, 31 Jan 2020 18:07:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7nm7026939 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E583360BE1; Fri, 31 Jan 2020 18:07:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18B8A60BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:48 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:07 -0600
Message-Id: <20200131180723.178863-10-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 09/25] gfs2: log error reform
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: iI_xUJonPDeuZeqHyT8bBg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h |  7 +++----
 fs/gfs2/log.c    | 16 ++++++++++++----
 fs/gfs2/quota.c  |  2 +-
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b95c8a31d309..ab89f746b3b6 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -615,9 +615,8 @@ enum {
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
index 9ebec6f93fa3..584bb7ce15bf 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -108,8 +108,7 @@ __acquires(&sdp->sd_ail_lock)
 =09=09=09=09=09  &tr->tr_ail2_list);
 =09=09=09=09continue;
 =09=09=09}
-=09=09=09if (!test_and_set_bit(SDF_AIL1_IO_ERROR,
-=09=09=09=09=09      &sdp->sd_flags)) {
+=09=09=09if (!cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09=09gfs2_withdraw_delayed(sdp);
 =09=09=09}
@@ -205,10 +204,19 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp,=
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
 =09=09=09gfs2_withdraw_delayed(sdp);
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
2.24.1

