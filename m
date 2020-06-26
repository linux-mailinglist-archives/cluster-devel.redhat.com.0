Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 935E320B6F0
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 19:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593192433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vnAgukC9feUE5fx8vXb2ln7WITVXa1QP9Y31QVCHsrU=;
	b=hZvouzyD4Udrbs9K/VmLHRntCEPNaOG0bQeUpC5TwUkk6Amu/n4jN74XVlQUdr5D8RNqsV
	BtJYk9yqhkMOECp93JyJDSyOZHv8YLcYDdQX0lZHs7cXT6LslCh3+29DAEYrUmwG4KWuus
	uZppUeisUPT02jr0514+IdvG23nh6jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-COlNaJ8kOTi1ZJ0G8eWvHw-1; Fri, 26 Jun 2020 13:27:11 -0400
X-MC-Unique: COlNaJ8kOTi1ZJ0G8eWvHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B54193F561;
	Fri, 26 Jun 2020 17:27:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C55AE10013D2;
	Fri, 26 Jun 2020 17:27:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A09D875B0;
	Fri, 26 Jun 2020 17:27:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QHR6Cn019148 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 13:27:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9BA78FF83; Fri, 26 Jun 2020 17:27:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64B9C1C8;
	Fri, 26 Jun 2020 17:27:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: davem@davemloft.net
Date: Fri, 26 Jun 2020 13:26:48 -0400
Message-Id: <20200626172650.115224-2-aahringo@redhat.com>
In-Reply-To: <20200626172650.115224-1-aahringo@redhat.com>
References: <20200626172650.115224-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: netdev@vger.kernel.org, cluster-devel@redhat.com, kuba@kernel.org
Subject: [Cluster-devel] [PATCHv2 dlm-next 1/3] net: sock: add sock_set_mark
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds a new socket helper function to set the mark value for a
kernel socket.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 include/net/sock.h | 1 +
 net/core/sock.c    | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/sock.h b/include/net/sock.h
index c53cc42b5ab92..591dd3f12dbb1 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2696,6 +2696,7 @@ void sock_no_linger(struct sock *sk);
 void sock_set_keepalive(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_rcvbuf(struct sock *sk, int val);
+void sock_set_mark(struct sock *sk, u32 val);
 void sock_set_reuseaddr(struct sock *sk);
 void sock_set_reuseport(struct sock *sk);
 void sock_set_sndtimeo(struct sock *sk, s64 secs);
diff --git a/net/core/sock.c b/net/core/sock.c
index 6c4acf1f0220b..ea6e8348b3dc8 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -828,6 +828,14 @@ void sock_set_rcvbuf(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(sock_set_rcvbuf);
 
+void sock_set_mark(struct sock *sk, u32 val)
+{
+	lock_sock(sk);
+	sk->sk_mark = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_mark);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
-- 
2.26.2

