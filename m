Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC741F1CB2
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4pIgt4mFiELSYUgEezZR1P0n2XaBgZEn+8FQIo/JIPs=;
	b=dlhqxctphsixym8f3Y8M18NtMevQnvmc+GIeNx7gKU7VaOynD0XWiICljs9/cRFooREp02
	ibMtT1PgV/wGM8cyLPB+QU04gmZVb6xdUNmZBnw++HnrrM+4yMPRFCOBFmOp5dtwmBUdd7
	c4I7RQZVsjTAxpBYE3Uo+F1/bzXTlQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-w9Q-2uhVOFe0K1XH_WAYng-1; Mon, 08 Jun 2020 12:02:28 -0400
X-MC-Unique: w9Q-2uhVOFe0K1XH_WAYng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89614108BD0A;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A9FB7B5F8;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 644FFB348B;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0pD5011636 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A229F60C1D; Mon,  8 Jun 2020 16:00:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A40D01CA;
	Mon,  8 Jun 2020 16:00:50 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:24 +0200
Message-Id: <20200608160039.549204-6-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/20] gfs2: print mapping->nrpages in glock
	dump for address space glocks
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

This patch makes the glock dumps in debugfs print the number of pages
(nrpages) for address space glocks. This will aid in debugging.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index bf70e3b14938..9a5dadc93cfc 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1978,7 +1978,13 @@ void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
 	char gflags_buf[32];
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
+	unsigned long nrpages = 0;
 
+	if (gl->gl_ops->go_flags & GLOF_ASPACE) {
+		struct address_space *mapping = gfs2_glock2aspace(gl);
+
+		nrpages = mapping->nrpages;
+	}
 	memset(fs_id_buf, 0, sizeof(fs_id_buf));
 	if (fsid && sdp) /* safety precaution */
 		sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
@@ -1987,15 +1993,16 @@ void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
 	if (!test_bit(GLF_DEMOTE, &gl->gl_flags))
 		dtime = 0;
 	gfs2_print_dbg(seq, "%sG:  s:%s n:%u/%llx f:%s t:%s d:%s/%llu a:%d "
-		       "v:%d r:%d m:%ld\n", fs_id_buf, state2str(gl->gl_state),
-		  gl->gl_name.ln_type,
-		  (unsigned long long)gl->gl_name.ln_number,
-		  gflags2str(gflags_buf, gl),
-		  state2str(gl->gl_target),
-		  state2str(gl->gl_demote_state), dtime,
-		  atomic_read(&gl->gl_ail_count),
-		  atomic_read(&gl->gl_revokes),
-		  (int)gl->gl_lockref.count, gl->gl_hold_time);
+		       "v:%d r:%d m:%ld p:%lu\n",
+		       fs_id_buf, state2str(gl->gl_state),
+		       gl->gl_name.ln_type,
+		       (unsigned long long)gl->gl_name.ln_number,
+		       gflags2str(gflags_buf, gl),
+		       state2str(gl->gl_target),
+		       state2str(gl->gl_demote_state), dtime,
+		       atomic_read(&gl->gl_ail_count),
+		       atomic_read(&gl->gl_revokes),
+		       (int)gl->gl_lockref.count, gl->gl_hold_time, nrpages);
 
 	list_for_each_entry(gh, &gl->gl_holders, gh_list)
 		dump_holder(seq, gh, fs_id_buf);
-- 
2.26.2

