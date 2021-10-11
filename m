Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9774297AD
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HnSyt9IGNr6SWQlG9+q6IMrYZ+OyvYkw/9tRJW/t5Qo=;
	b=L1/+aPv0TYse/jk6DE3vQri52KzPXnQY2WIrj/SuHsLteeb/qtyCsJKOsoSjUteKDdoaLZ
	0bm+1DBVWrdoZNGoP07VH2Z6Fmyf9P3v3oMKxtYzGtmn0MOoVGpsRlW70u9gh+icfH1q1v
	obxoBRn+X3LS+R0hCHJ/whY0llGdly8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-0SuWFukiP5G3G2bWtLs6xw-1; Mon, 11 Oct 2021 15:40:37 -0400
X-MC-Unique: 0SuWFukiP5G3G2bWtLs6xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A514F100C612;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96EB960871;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4E294EA2F;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeUAp028793 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A221E26DE2; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 713A226E43
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:01 -0500
Message-Id: <20211011194008.50097-7-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 06/13] gfs2: Remove 'first'
	trace_gfs2_promote argument
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Andreas Gruenbacher <agruenba@redhat.com>

Remove the 'first' argument of trace_gfs2_promote: with GL_SKIP, the
'first' holder isn't the one that instantiates the glock
(gl_instantiate), which is what the 'first' flag was apparently supposed
to indicate.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c      | 4 ++--
 fs/gfs2/trace_gfs2.h | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 09eb7d4bdf80..7271b4dd6d6a 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -419,12 +419,12 @@ __acquires(&gl->gl_lockref.lock)
 					}
 				}
 				set_bit(HIF_HOLDER, &gh->gh_iflags);
-				trace_gfs2_promote(gh, 1);
+				trace_gfs2_promote(gh);
 				gfs2_holder_wake(gh);
 				goto restart;
 			}
 			set_bit(HIF_HOLDER, &gh->gh_iflags);
-			trace_gfs2_promote(gh, 0);
+			trace_gfs2_promote(gh);
 			gfs2_holder_wake(gh);
 			continue;
 		}
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index bd6c8e9e49db..a5deb9f86831 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -197,15 +197,14 @@ TRACE_EVENT(gfs2_demote_rq,
 /* Promotion/grant of a glock */
 TRACE_EVENT(gfs2_promote,
 
-	TP_PROTO(const struct gfs2_holder *gh, int first),
+	TP_PROTO(const struct gfs2_holder *gh),
 
-	TP_ARGS(gh, first),
+	TP_ARGS(gh),
 
 	TP_STRUCT__entry(
 		__field(        dev_t,  dev                     )
 		__field(	u64,	glnum			)
 		__field(	u32,	gltype			)
-		__field(	int,	first			)
 		__field(	u8,	state			)
 	),
 
@@ -213,14 +212,12 @@ TRACE_EVENT(gfs2_promote,
 		__entry->dev	= gh->gh_gl->gl_name.ln_sbd->sd_vfs->s_dev;
 		__entry->glnum	= gh->gh_gl->gl_name.ln_number;
 		__entry->gltype	= gh->gh_gl->gl_name.ln_type;
-		__entry->first	= first;
 		__entry->state	= glock_trace_state(gh->gh_state);
 	),
 
-	TP_printk("%u,%u glock %u:%llu promote %s %s",
+	TP_printk("%u,%u glock %u:%llu promote %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->gltype,
 		  (unsigned long long)__entry->glnum,
-		  __entry->first ? "first": "other",
 		  glock_trace_name(__entry->state))
 );
 
-- 
2.31.1

