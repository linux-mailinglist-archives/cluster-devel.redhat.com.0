Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2E917E415
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Mar 2020 16:54:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583769270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=955srAMMGt3vUttn8xXnj1mLpe2NpPwom2hswLA3HWE=;
	b=AsM5DV1QRpuAo8VEH1ZigzthLRlEcpdJKMLc8lT9ZztXCq4NumtGFPLPSbUWYDuENg5ol3
	14Pmsc/Sux2l4BBdnn/4T8EvbRKcjS1De2A4gfpQCfjHk9Ot1/MbwGS52Rj4lK7/9nAN3X
	VwdUatfdphS14W5UANUQYc0XE658yEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-IaOLIRIuOqi0KukG5mmMcw-1; Mon, 09 Mar 2020 11:54:24 -0400
X-MC-Unique: IaOLIRIuOqi0KukG5mmMcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF3718B9FC3;
	Mon,  9 Mar 2020 15:54:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06BDD73879;
	Mon,  9 Mar 2020 15:54:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49EEC86A04;
	Mon,  9 Mar 2020 15:54:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029FsHqc019169 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 11:54:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8A232166B2F; Mon,  9 Mar 2020 15:54:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A972166B2E
	for <cluster-devel@redhat.com>; Mon,  9 Mar 2020 15:54:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0E0680030F
	for <cluster-devel@redhat.com>; Mon,  9 Mar 2020 15:54:15 +0000 (UTC)
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
	[192.185.48.38]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-207-K1XBZWJmP3m_RjLazWUKrQ-1; Mon, 09 Mar 2020 11:54:13 -0400
X-MC-Unique: K1XBZWJmP3m_RjLazWUKrQ-1
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
	by gateway20.websitewelcome.com (Postfix) with ESMTP id 80D94400D57AD
	for <cluster-devel@redhat.com>; Mon,  9 Mar 2020 09:39:15 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id BKjMjvChXEfyqBKjMjxrxX; Mon, 09 Mar 2020 10:54:12 -0500
X-Authority-Reason: nr=8
Received: from [201.162.240.150] (port=24477 helo=embeddedor)
	by gator4166.hostgator.com with esmtpa (Exim 4.92)
	(envelope-from <gustavo@embeddedor.com>)
	id 1jBKjK-0030kr-LK; Mon, 09 Mar 2020 10:54:11 -0500
Date: Mon, 9 Mar 2020 10:57:22 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Message-ID: <20200309155722.GA32023@embeddedor>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.240.150
X-Source-L: No
X-Exim-ID: 1jBKjK-0030kr-LK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.240.150]:24477
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029FsHqc019169
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [Cluster-devel] [PATCH][next] dlm: user: Replace zero-length array
 with flexible-array member
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/dlm/user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 5264bac75115..e5cefa90b1ce 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -46,7 +46,7 @@ struct dlm_lock_params32 {
 =09__u32 bastaddr;
 =09__u32 lksb;
 =09char lvb[DLM_USER_LVB_LEN];
-=09char name[0];
+=09char name[];
 };
=20
 struct dlm_write_request32 {
--=20
2.25.0


