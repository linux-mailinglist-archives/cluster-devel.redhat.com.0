Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B6EA713930D
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jan 2020 15:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578924275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3HPCg40mRpwJ1cxR4+GJC0Kyf2pJ12fuRoInDH5DQok=;
	b=UnXzN4f2eAb6jzKc+KSo3jDK+ZLt9lrZ0gRO4JOw8H46ZKho0b382tZ2CClM81uY9raVo/
	bIVtJGhh0A+tVE5rm6vbpAtXOlXrdRch/dUdWDEOwcw0JXGSZbC/u1pq0dQi82v/jO+MVQ
	SC7lO9v3xSSJBY6WMiQuF6bdDBWFUSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-qM0yQ7eqMhaXh4L4rtb7JA-1; Mon, 13 Jan 2020 09:04:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B181800D78;
	Mon, 13 Jan 2020 14:04:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCEADA4B60;
	Mon, 13 Jan 2020 14:04:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D3538250F;
	Mon, 13 Jan 2020 14:04:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DE4Pxd017077 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 09:04:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C90BF19756; Mon, 13 Jan 2020 14:04:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A62619C6A
	for <cluster-devel@redhat.com>; Mon, 13 Jan 2020 14:04:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Jan 2020 08:04:21 -0600
Message-Id: <20200113140421.867659-3-rpeterso@redhat.com>
In-Reply-To: <20200113140421.867659-1-rpeterso@redhat.com>
References: <20200113140421.867659-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/2 v3] gfs2: keep a redirty list for
	jdata pages that are PageChecked in ail1
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
X-MC-Unique: qM0yQ7eqMhaXh4L4rtb7JA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, jdata writes would sometimes get into an infinite
loop because function gfs2_ail1_flush refused to exit until all of
its pages were written out, but if the page was in use and another
process sets PageChecked, it would never be written out: The
PageChecked prevented the ail1 list from being written:

gfs2_logd() calls gfs2_ail1_start() because it decides it needs to
  gfs2_ail1_start() calls gfs2_ail1_flush() (unconditionally)
    gfs2_ail1_flush() calls gfs2_ail1_start_one() for each transaction
                      queued onto sd_ail1_list, to start that transaction
      gfs2_ail1_start_one() calls generic_writepages() for this
                      particular problematic transaction.
        generic_writepages() calls write_cache_pages() passing in
                      __writepage (unconditionally)
          write_cache_pages() calls (*writepage) which maps to __writepage(=
)
            __writepage() calls mapping->a_ops->writepage which maps
                      to gfs2_jdata_writepage
              gfs2_jdata_writepage() sees the page is PageChecked
                      (i.e. dirty is pending) so it skips
                      __gfs2_jdata_writepage and instead redirties
                      the page, returns 0.
            __writepage() returns 0 to write_cache_pages()
          write_cache_pages() returns 0 to generic_writepages()
        generic_writepages() returns 0 to gfs2_ail1_start_one()
       gfs2_ail1_start_one() returns 1 to gfs2_ail1_flush(), which
                      causes it to goto restart; (Infinite loop)

Thus, logd goes into an infinite loop, chewing up 100% of
one CPU, and all other transactions get blocked by the flush.

This patch adds a new queue to the transactions, tr_redirty_list.
This temporarily holds buffer descriptor (bd / bufdata) elements
that need to be redirtied because they were PageChecked while the
ail1 list was being flushed.

The new queue allows all eligible pages to be written properly and
gfs2_ail1_flush to requeue and redirty PageChecked pages. Thus, the
pages are redirtied and go into the next ail1 flush cycle. The current
ail1 flush completes, since those pages are temporarily moved off the
list.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  1 +
 fs/gfs2/log.c    | 27 +++++++++++++++++++++++++++
 fs/gfs2/trans.c  |  1 +
 3 files changed, 29 insertions(+)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index a5d81a261f77..eef686161953 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -514,6 +514,7 @@ struct gfs2_trans {
 =09unsigned int tr_first;
 =09struct list_head tr_ail1_list;
 =09struct list_head tr_ail2_list;
+=09struct list_head tr_redirty_list;
 };
=20
 struct gfs2_journal_extent {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6e2728416b6b..7d7bae63b3e1 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -119,6 +119,10 @@ __acquires(&sdp->sd_ail_lock)
 =09=09if (gl =3D=3D bd->bd_gl)
 =09=09=09continue;
 =09=09gl =3D bd->bd_gl;
+=09=09if (PageChecked(bh->b_page)) {
+=09=09=09list_move(&bd->bd_ail_st_list, &tr->tr_redirty_list);
+=09=09=09continue;
+=09=09}
 =09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail1_list);
 =09=09mapping =3D bh->b_page->mapping;
 =09=09if (!mapping)
@@ -219,11 +223,21 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp,=
 struct gfs2_trans *tr,
  * @sdp: The superblock
  *
  * Tries to empty the ail1 lists, starting with the oldest first
+ * Then it requeues any buffers that need to be redirtied, to the ail1 lis=
t.
+ * It returns true if the ail1 list was empty BEFORE the redirtied entries
+ * were requeued.
  */
=20
 static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 {
 =09struct gfs2_trans *tr, *s;
+=09struct gfs2_bufdata *bd;
+=09struct writeback_control wbc =3D {
+=09=09.sync_mode =3D WB_SYNC_NONE,
+=09=09.nr_to_write =3D LONG_MAX,
+=09=09.range_start =3D 0,
+=09=09.range_end =3D LLONG_MAX,
+=09};
 =09int oldest_tr =3D 1;
 =09int ret;
 =09bool withdraw =3D false;
@@ -237,6 +251,19 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 =09=09=09oldest_tr =3D 0;
 =09}
 =09ret =3D list_empty(&sdp->sd_ail1_list);
+=09/*
+=09 * Now requeue and redirty any bufdata elements that were not written
+=09 * because they were PageChecked.
+=09 */
+=09list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
+=09=09while (!list_empty(&tr->tr_redirty_list)) {
+=09=09=09bd =3D list_first_entry(&tr->tr_redirty_list,
+=09=09=09=09=09      struct gfs2_bufdata,
+=09=09=09=09=09      bd_ail_st_list);
+=09=09=09redirty_page_for_writepage(&wbc, bd->bd_bh->b_page);
+=09=09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail1_list);
+=09=09}
+=09}
 =09spin_unlock(&sdp->sd_ail_lock);
=20
 =09if (withdraw)
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index a685637a5b55..0545490cb4e3 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -52,6 +52,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
 =09=09tr->tr_reserved +=3D gfs2_struct2blk(sdp, revokes);
 =09INIT_LIST_HEAD(&tr->tr_databuf);
 =09INIT_LIST_HEAD(&tr->tr_buf);
+=09INIT_LIST_HEAD(&tr->tr_redirty_list);
=20
 =09sb_start_intwrite(sdp->sd_vfs);
=20
--=20
2.24.1

