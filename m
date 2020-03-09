Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 59F1617E40B
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Mar 2020 16:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583769197;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WtNZxn6xUDvQcyxuK3NUwuq8TtdhIwRGSCtQqhrNE3c=;
	b=fs2nDIgRShVq6wqE26bdJ8UL0mt2FmR6Ba2Gv79GsqgUCO6NaRwOyb4GsP/Ni01vXk6mN6
	wRmgfHkdOK2UlbjaVCMt6R2nJCacn8itJlfAtWL3jLFO2CGvgqaN8VlXsXcAlbgJn1ea41
	7vaqwwzNg+FacITnZSYN7svt5jzP2qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-4pneXF0OPjuCfMzmvFcyvw-1; Mon, 09 Mar 2020 11:53:15 -0400
X-MC-Unique: 4pneXF0OPjuCfMzmvFcyvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150B9800D6C;
	Mon,  9 Mar 2020 15:53:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5DC60C88;
	Mon,  9 Mar 2020 15:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94E8A86A04;
	Mon,  9 Mar 2020 15:53:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029Fr3xI019088 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 11:53:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5705C10BBCC1; Mon,  9 Mar 2020 15:53:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50ABD10BBCD5
	for <cluster-devel@redhat.com>; Mon,  9 Mar 2020 15:53:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E35B8BA51A
	for <cluster-devel@redhat.com>; Mon,  9 Mar 2020 15:53:01 +0000 (UTC)
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
	[192.185.143.35]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-tmggQGtuN7mBXtmz8IUnHA-1; Mon, 09 Mar 2020 11:52:58 -0400
X-MC-Unique: tmggQGtuN7mBXtmz8IUnHA-1
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
	by gateway31.websitewelcome.com (Postfix) with ESMTP id 8EBED4DC4E
	for <cluster-devel@redhat.com>; Mon,  9 Mar 2020 10:52:57 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id BKi9jI4mT8vkBBKi9jAxY1; Mon, 09 Mar 2020 10:52:57 -0500
X-Authority-Reason: nr=8
Received: from [201.162.240.150] (port=28052 helo=embeddedor)
	by gator4166.hostgator.com with esmtpa (Exim 4.92)
	(envelope-from <gustavo@embeddedor.com>)
	id 1jBKi7-00302e-Nn; Mon, 09 Mar 2020 10:52:56 -0500
Date: Mon, 9 Mar 2020 10:56:08 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Message-ID: <20200309155608.GA31883@embeddedor>
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
X-Exim-ID: 1jBKi7-00302e-Nn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.240.150]:28052
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029Fr3xI019088
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [Cluster-devel] [PATCH][next] dlm: dlm_internal: Replace
 zero-length array with flexible-array member
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 fs/dlm/dlm_internal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 416d9de35679..d231ae5d2c65 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -421,7 +421,7 @@ struct dlm_message {
 =09int=09=09=09m_bastmode;
 =09int=09=09=09m_asts;
 =09int=09=09=09m_result;=09/* 0 or -EXXX */
-=09char=09=09=09m_extra[0];=09/* name or lvb */
+=09char=09=09=09m_extra[];=09/* name or lvb */
 };
=20
=20
@@ -450,7 +450,7 @@ struct dlm_rcom {
 =09uint64_t=09=09rc_id;=09=09/* match reply with request */
 =09uint64_t=09=09rc_seq;=09=09/* sender's ls_recover_seq */
 =09uint64_t=09=09rc_seq_reply;=09/* remote ls_recover_seq */
-=09char=09=09=09rc_buf[0];
+=09char=09=09=09rc_buf[];
 };
=20
 union dlm_packet {
@@ -506,7 +506,7 @@ struct rcom_lock {
 =09__le16=09=09=09rl_wait_type;
 =09__le16=09=09=09rl_namelen;
 =09char=09=09=09rl_name[DLM_RESNAME_MAXLEN];
-=09char=09=09=09rl_lvb[0];
+=09char=09=09=09rl_lvb[];
 };
=20
 /*
--=20
2.25.0


