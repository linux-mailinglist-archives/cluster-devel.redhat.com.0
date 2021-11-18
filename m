Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAC455718
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Nov 2021 09:36:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-h5D9bwg4N16b4gQ4yVDCCw-1; Thu, 18 Nov 2021 03:36:04 -0500
X-MC-Unique: h5D9bwg4N16b4gQ4yVDCCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E000D18125C0;
	Thu, 18 Nov 2021 08:36:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5540A60BF1;
	Thu, 18 Nov 2021 08:36:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E22014E58F;
	Thu, 18 Nov 2021 08:35:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AI8ZrW0012794 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 03:35:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1125351DD; Thu, 18 Nov 2021 08:35:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BDCC51DC
	for <cluster-devel@redhat.com>; Thu, 18 Nov 2021 08:35:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23C938007B1
	for <cluster-devel@redhat.com>; Thu, 18 Nov 2021 08:35:50 +0000 (UTC)
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be
	[195.130.137.77]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-521-L7i_U4SINqeU_aChRSrA0A-1; Thu, 18 Nov 2021 03:35:48 -0500
X-MC-Unique: L7i_U4SINqeU_aChRSrA0A-1
Received: from albert.telenet-ops.be (albert.telenet-ops.be
	[IPv6:2a02:1800:110:4::f00:1a])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4HvtD46GSKzMqd1k
	for <cluster-devel@redhat.com>; Thu, 18 Nov 2021 09:25:56 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:8d84:8075:bcc:d376])
	by albert.telenet-ops.be with bizsmtp
	id KkRv260044DeBRs06kRv0q; Thu, 18 Nov 2021 09:25:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps (TLS1.3) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mncjy-00DJaP-D6; Thu, 18 Nov 2021 09:25:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mnci4-0047wv-Dz; Thu, 18 Nov 2021 09:23:56 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Alexander Aring <aahringo@redhat.com>,
	Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Date: Thu, 18 Nov 2021 09:23:55 +0100
Message-Id: <20211118082355.983825-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AI8ZrW0012794
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, netdev@vger.kernel.org,
	"Reported-by : Randy Dunlap" <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] fs: dlm: Protect IPV6 field access by
	CONFIG_IPV6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If CONFIG_IPV6=n:

    In file included from fs/dlm/lowcomms.c:46:
    fs/dlm/lowcomms.c: In function ‘lowcomms_error_report’:
    ./include/net/sock.h:386:34: error: ‘struct sock_common’ has no member named ‘skc_v6_daddr’; did you mean ‘skc_daddr’?
      386 | #define sk_v6_daddr  __sk_common.skc_v6_daddr
	  |                                  ^~~~~~~~~~~~
    ./include/linux/printk.h:422:19: note: in expansion of macro ‘sk_v6_daddr’
      422 |   _p_func(_fmt, ##__VA_ARGS__);    \
	  |                   ^~~~~~~~~~~
    ./include/linux/printk.h:450:26: note: in expansion of macro ‘printk_index_wrap’
      450 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
	  |                          ^~~~~~~~~~~~~~~~~
    ./include/linux/printk.h:644:3: note: in expansion of macro ‘printk’
      644 |   printk(fmt, ##__VA_ARGS__);    \
	  |   ^~~~~~
    fs/dlm/lowcomms.c:612:3: note: in expansion of macro ‘printk_ratelimited’
      612 |   printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
	  |   ^~~~~~~~~~~~~~~~~~

Fix this by protecting the code that accesses IPV6-only fields by a
check for CONFIG_IPV6.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 4c3d90570bcc2b33 ("fs: dlm: don't call kernel_getpeername() in error_report()")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 fs/dlm/lowcomms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 203470189011102d..f7fc1ac76ce83a5f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -608,6 +608,7 @@ static void lowcomms_error_report(struct sock *sk)
 				   ntohs(inet->inet_dport), sk->sk_err,
 				   sk->sk_err_soft);
 		break;
+#if IS_ENABLED(CONFIG_IPV6)
 	case AF_INET6:
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "sending to node %d at %pI6c, "
@@ -616,6 +617,7 @@ static void lowcomms_error_report(struct sock *sk)
 				   ntohs(inet->inet_dport), sk->sk_err,
 				   sk->sk_err_soft);
 		break;
+#endif
 	default:
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "invalid socket family %d set, "
-- 
2.25.1


