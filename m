Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51B202A382F
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365500;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K5jW8a1Dj2S5Zqo8+CHbmlny7fZxnVB/4x95bwCef+4=;
	b=VD1nC+Ruq3eGk9uXWAxwqS3AIUhaltp4X4LrGmciYDmGGowULL1G3ROzN8B1drom/a1Svj
	ZqgrCp/0Q6ogRcaHHGuNiXqO3r6748NGjQHiRnXHihgvRDAKcZMyPGoezUmat+ydGWOA8J
	KzSUJwWXxlkD+KTM2MQaskBI5z8GeZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-kIYk-pdOMkmRcyGdNamgiA-1; Mon, 02 Nov 2020 20:04:56 -0500
X-MC-Unique: kIYk-pdOMkmRcyGdNamgiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69C131868418;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5953A5DA33;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41D81181A07B;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314p42003592 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 98376177F9; Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 301B05C5DE;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:27 -0500
Message-Id: <20201103010428.1009384-13-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 12/13] fs: dlm: constify
	addr_compare
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch just constify some function parameter which should be have a
read access only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f7e86791a082..7f85594b663a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -274,7 +274,8 @@ static struct dlm_node_addr *find_node_addr(int nodeid)
 	return NULL;
 }
 
-static int addr_compare(struct sockaddr_storage *x, struct sockaddr_storage *y)
+static int addr_compare(const struct sockaddr_storage *x,
+			const struct sockaddr_storage *y)
 {
 	switch (x->ss_family) {
 	case AF_INET: {
-- 
2.26.2

