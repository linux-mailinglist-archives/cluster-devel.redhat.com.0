Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 748231F03CF
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Iop87OnXXVafp+GeJTjlJInt6LQ+IG7IPnudMYyduwM=;
	b=SFdaX7y+EjXkezCu5IJ+lPVM7CEoKRhpstrjFAGRnWXLEMIEqgal2xg1DDYGOdoCQcqdP1
	12hmS/eFA0nneOjulJWw/DwBN8mJYTqHBwEd1m3NXVqeJ1itXN/TZv41fPnqYds80vYo2u
	caFUlFGLJyQSUKgPZfE1Q2esU+dkjbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-9lc83opLNjCopTYM000zJg-1; Fri, 05 Jun 2020 20:22:30 -0400
X-MC-Unique: 9lc83opLNjCopTYM000zJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B6AB19057A8;
	Sat,  6 Jun 2020 00:22:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 475B85D9C5;
	Sat,  6 Jun 2020 00:22:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3696B3493;
	Sat,  6 Jun 2020 00:22:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Gl8q2020678 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:47:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 173FA7B60D; Fri,  5 Jun 2020 16:47:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-115-80.phx2.redhat.com [10.3.115.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF4287B617
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:47:05 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  5 Jun 2020 11:46:57 -0500
Message-Id: <20200605164701.30776-3-rpeterso@redhat.com>
In-Reply-To: <20200605164701.30776-1-rpeterso@redhat.com>
References: <20200605164701.30776-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/6] gfs2: print mapping->nrpages in
	glock dump for address space glocks
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
Content-Transfer-Encoding: 8bit

This patch makes the glock dumps in debugfs print the number of pages
(nrpages) for address space glocks. This will aid in debugging.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
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

