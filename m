Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0119A1F4238
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 19:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591723765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uoT+u5bWbyMFJIgKGeUfM5AiiAda1J39gulhjpD/0oo=;
	b=icfEkhZ/+5qItnRjuCnQlLltKoFOMJS5c+ZQcdqCsqU/1gPX9CRuK3w5GsejmFbg9C+LV7
	JH5tSchH59IDRpBmqcCIuOfouizjVtkc5PslSY4dsFBuxY0IWlvBtv8oZIZ8C3jdc03+jl
	7xlE8idXt46n5I5djSlt4/aV0QMNWaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-XjwV0CtTO_a1rjPnq2phsA-1; Tue, 09 Jun 2020 13:29:23 -0400
X-MC-Unique: XjwV0CtTO_a1rjPnq2phsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C795100CCC2;
	Tue,  9 Jun 2020 17:29:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 421E55C1BD;
	Tue,  9 Jun 2020 17:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B2BF1809547;
	Tue,  9 Jun 2020 17:29:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059HTCA5000620 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:29:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C69D17A8CC; Tue,  9 Jun 2020 17:29:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C235E7A1EB
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 17:29:10 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CEFD1809542
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 17:29:10 +0000 (UTC)
Date: Tue, 9 Jun 2020 13:29:08 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1364299943.32999353.1591723748150.JavaMail.zimbra@redhat.com>
In-Reply-To: <2107416922.32999348.1591723732042.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.3]
Thread-Topic: gfs2: Add some flags missing from glock output
Thread-Index: tWkP+a6FvFLULFj6FLSSMCwb5BUdwg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Add some flags missing from
	glock output
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, three flags were not represented in the glock output.
This patch adds them in:

c - GLF_INODE_CREATING
P - GLF_PENDING_DELETE
x - GLF_FREEING (both f and F are already used)

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2299dcc417ea..d77985ef5be0 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2103,6 +2103,12 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
 		*p++ = 'o';
 	if (test_bit(GLF_BLOCKING, gflags))
 		*p++ = 'b';
+	if (test_bit(GLF_INODE_CREATING, gflags))
+		*p++ = 'c';
+	if (test_bit(GLF_PENDING_DELETE, gflags))
+		*p++ = 'P';
+	if (test_bit(GLF_FREEING, gflags))
+		*p++ = 'x';
 	*p = 0;
 	return buf;
 }

