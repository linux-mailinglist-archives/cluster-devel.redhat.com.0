Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 32A1F1E7D65
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 14:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590755981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cWUTtlFm6rduEFgMkQS8bZjX0MpfbR8IuxRNGH3yJJc=;
	b=W9YV52Fl0UXJ9GKcqSqAxiOWHSmJ+CJQIW7hlCif/ZtQk00SvSK9w5OT15KvgMnWuZhQBC
	ykjumPGNB2KHsn3fMdA8xzF7pVcWHtC0SWZDAs3NZhuawFXwe65Yvfb+fUKQif0IV5uEcR
	B4M5RNxhMaD6Hsby2LMV6+gSE5Bp4Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-XC1LiCuEPqqVOTQfz1ZISA-1; Fri, 29 May 2020 08:39:39 -0400
X-MC-Unique: XC1LiCuEPqqVOTQfz1ZISA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BBA718A8230;
	Fri, 29 May 2020 12:39:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55BC8A2933;
	Fri, 29 May 2020 12:39:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E6A41809547;
	Fri, 29 May 2020 12:39:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TCdXl0009369 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 08:39:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA409202696C; Fri, 29 May 2020 12:39:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A581B2026E1C
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:39:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D38BE8007A4
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:39:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-439-vVekJwzDMk66VswwqahyxQ-1; Fri, 29 May 2020 08:39:28 -0400
X-MC-Unique: vVekJwzDMk66VswwqahyxQ-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jedpk-0006Ko-Pu; Fri, 29 May 2020 12:09:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Vlad Yasevich <vyasevich@gmail.com>, Neil Horman <nhorman@tuxdriver.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Date: Fri, 29 May 2020 14:09:41 +0200
Message-Id: <20200529120943.101454-3-hch@lst.de>
In-Reply-To: <20200529120943.101454-1-hch@lst.de>
References: <20200529120943.101454-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@ACULAB.COM>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 2/4] sctp: refactor sctp_setsockopt_bindx
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Split out a sctp_setsockopt_bindx_kernel that takes a kernel pointer
to the sockaddr and make sctp_setsockopt_bindx a small wrapper around
it.  This prepares for adding a new bind_add proto op.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/sctp/socket.c | 61 ++++++++++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 827a9903ee288..6e745ac3c4a59 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -972,23 +972,22 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
  * it.
  *
  * sk        The sk of the socket
- * addrs     The pointer to the addresses in user land
+ * addrs     The pointer to the addresses
  * addrssize Size of the addrs buffer
  * op        Operation to perform (add or remove, see the flags of
  *           sctp_bindx)
  *
  * Returns 0 if ok, <0 errno code on error.
  */
-static int sctp_setsockopt_bindx(struct sock *sk,
-				 struct sockaddr __user *addrs,
-				 int addrs_size, int op)
+static int sctp_setsockopt_bindx_kernel(struct sock *sk,
+					struct sockaddr *addrs, int addrs_size,
+					int op)
 {
-	struct sockaddr *kaddrs;
 	int err;
 	int addrcnt = 0;
 	int walk_size = 0;
 	struct sockaddr *sa_addr;
-	void *addr_buf;
+	void *addr_buf = addrs;
 	struct sctp_af *af;
 
 	pr_debug("%s: sk:%p addrs:%p addrs_size:%d opt:%d\n",
@@ -997,17 +996,10 @@ static int sctp_setsockopt_bindx(struct sock *sk,
 	if (unlikely(addrs_size <= 0))
 		return -EINVAL;
 
-	kaddrs = memdup_user(addrs, addrs_size);
-	if (IS_ERR(kaddrs))
-		return PTR_ERR(kaddrs);
-
 	/* Walk through the addrs buffer and count the number of addresses. */
-	addr_buf = kaddrs;
 	while (walk_size < addrs_size) {
-		if (walk_size + sizeof(sa_family_t) > addrs_size) {
-			kfree(kaddrs);
+		if (walk_size + sizeof(sa_family_t) > addrs_size)
 			return -EINVAL;
-		}
 
 		sa_addr = addr_buf;
 		af = sctp_get_af_specific(sa_addr->sa_family);
@@ -1015,10 +1007,8 @@ static int sctp_setsockopt_bindx(struct sock *sk,
 		/* If the address family is not supported or if this address
 		 * causes the address buffer to overflow return EINVAL.
 		 */
-		if (!af || (walk_size + af->sockaddr_len) > addrs_size) {
-			kfree(kaddrs);
+		if (!af || (walk_size + af->sockaddr_len) > addrs_size)
 			return -EINVAL;
-		}
 		addrcnt++;
 		addr_buf += af->sockaddr_len;
 		walk_size += af->sockaddr_len;
@@ -1029,31 +1019,36 @@ static int sctp_setsockopt_bindx(struct sock *sk,
 	case SCTP_BINDX_ADD_ADDR:
 		/* Allow security module to validate bindx addresses. */
 		err = security_sctp_bind_connect(sk, SCTP_SOCKOPT_BINDX_ADD,
-						 (struct sockaddr *)kaddrs,
-						 addrs_size);
+						 addrs, addrs_size);
 		if (err)
-			goto out;
-		err = sctp_bindx_add(sk, kaddrs, addrcnt);
+			return err;
+		err = sctp_bindx_add(sk, addrs, addrcnt);
 		if (err)
-			goto out;
-		err = sctp_send_asconf_add_ip(sk, kaddrs, addrcnt);
-		break;
-
+			return err;
+		return sctp_send_asconf_add_ip(sk, addrs, addrcnt);
 	case SCTP_BINDX_REM_ADDR:
-		err = sctp_bindx_rem(sk, kaddrs, addrcnt);
+		err = sctp_bindx_rem(sk, addrs, addrcnt);
 		if (err)
-			goto out;
-		err = sctp_send_asconf_del_ip(sk, kaddrs, addrcnt);
-		break;
+			return err;
+		return sctp_send_asconf_del_ip(sk, addrs, addrcnt);
 
 	default:
-		err = -EINVAL;
-		break;
+		return -EINVAL;
 	}
+}
 
-out:
-	kfree(kaddrs);
+static int sctp_setsockopt_bindx(struct sock *sk,
+				 struct sockaddr __user *addrs,
+				 int addrs_size, int op)
+{
+	struct sockaddr *kaddrs;
+	int err;
 
+	kaddrs = memdup_user(addrs, addrs_size);
+	if (IS_ERR(kaddrs))
+		return PTR_ERR(kaddrs);
+	err = sctp_setsockopt_bindx_kernel(sk, kaddrs, addrs_size, op);
+	kfree(kaddrs);
 	return err;
 }
 
-- 
2.26.2

