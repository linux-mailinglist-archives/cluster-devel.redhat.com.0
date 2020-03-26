Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id DB7071946B2
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 19:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585248031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7IARPtG+gD7az9MtBtHADXHV9LsYKVy7k5x6+4BrHmM=;
	b=hUkToBo8qk9i8cE7C3ktwxEwigoJ7824T2aBaiLTWGTdRYjsob01p8PIY0cKKylIn5yfd0
	u9BODNgTMUuHxx8Tm7MoXYexOJFZtUiI+/yeH9yL+gVVQDHhOHQfrYvRfmVx0H9W4jmhnP
	iq0sTMunhaiUxJNtLyec63C9lKZNeE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-eERute4SO0yZXuvP2_CYYw-1; Thu, 26 Mar 2020 14:40:29 -0400
X-MC-Unique: eERute4SO0yZXuvP2_CYYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77A3A800D48;
	Thu, 26 Mar 2020 18:40:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64BD25DA7C;
	Thu, 26 Mar 2020 18:40:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A22918089D0;
	Thu, 26 Mar 2020 18:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QIePLE005028 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 14:40:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 696BA90538; Thu, 26 Mar 2020 18:40:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DAAA5C1BA
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 18:40:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 26 Mar 2020 13:40:17 -0500
Message-Id: <20200326184020.123544-3-rpeterso@redhat.com>
In-Reply-To: <20200326184020.123544-1-rpeterso@redhat.com>
References: <20200326184020.123544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/5] gfs2: instrumentation wrt ail1
	stuck
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, if the ail1 flush got stuck for some reason, there
were no clues as to why. This patch introduces a check for getting
stuck for more than a minute, and if it happens, it dumps the items
still remaining on the ail1 list.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 87f3e892be3e..2abec43ae898 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -139,6 +139,41 @@ __acquires(&sdp->sd_ail_lock)
 =09return ret;
 }
=20
+static void dump_ail_list(struct gfs2_sbd *sdp)
+{
+=09struct gfs2_trans *tr;
+=09struct gfs2_bufdata *bd;
+=09struct buffer_head *bh;
+
+=09fs_err(sdp, "Error: In gfs2_ail1_flush for a minute! t=3D%d\n",
+=09       current->journal_info ? 1 : 0);
+
+=09list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
+=09=09list_for_each_entry_reverse(bd, &tr->tr_ail1_list,
+=09=09=09=09=09    bd_ail_st_list) {
+=09=09=09bh =3D bd->bd_bh;
+=09=09=09fs_err(sdp, "bd %p: blk:0x%llx bh=3D%p ", bd,
+=09=09=09       (unsigned long long)bd->bd_blkno, bh);
+=09=09=09if (!bh) {
+=09=09=09=09fs_err(sdp, "\n");
+=09=09=09=09continue;
+=09=09=09}
+=09=09=09fs_err(sdp, "0x%llx up2:%d dirt:%d lkd:%d req:%d "
+=09=09=09       "map:%d new:%d ar:%d aw:%d delay:%d "
+=09=09=09       "io err:%d unwritten:%d dfr:%d pin:%d esc:%d\n",
+=09=09=09       (unsigned long long)bh->b_blocknr,
+=09=09=09       buffer_uptodate(bh), buffer_dirty(bh),
+=09=09=09       buffer_locked(bh), buffer_req(bh),
+=09=09=09       buffer_mapped(bh), buffer_new(bh),
+=09=09=09       buffer_async_read(bh), buffer_async_write(bh),
+=09=09=09       buffer_delay(bh), buffer_write_io_error(bh),
+=09=09=09       buffer_unwritten(bh),
+=09=09=09       buffer_defer_completion(bh),
+=09=09=09       buffer_pinned(bh), buffer_escaped(bh));
+=09=09=09fs_err(sdp, "\n");
+=09=09}
+=09}
+}
=20
 /**
  * gfs2_ail1_flush - start writeback of some ail1 entries=20
@@ -155,11 +190,16 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct wri=
teback_control *wbc)
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
 =09int ret =3D 0;
+=09unsigned long flush_start =3D jiffies;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
 =09spin_lock(&sdp->sd_ail_lock);
 restart:
+=09if (time_after(jiffies, flush_start + (HZ * 60))) {
+=09=09dump_ail_list(sdp);
+=09=09goto out;
+=09}
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
@@ -170,6 +210,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09=09=09break;
 =09=09}
 =09}
+out:
 =09spin_unlock(&sdp->sd_ail_lock);
 =09blk_finish_plug(&plug);
 =09if (ret) {
--=20
2.25.1

