Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E62302D9957
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 15:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607954557;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q8B6xTNYNeYHCclWCJrqTdPeJCbBxD5Ljw7fhLZaWSM=;
	b=B3o/aVek6lzV6pHgiviRqZxM2cH6FhcO8M5oBR2tpvRA3gwXFewHlcdKOuYe6FPZXjAerM
	pdNDZqAlSrfg+dCch6Azkq798+pbKw7+2RFOZo82pA/W3cB1eS+7rD6V2hB5vrrVM7aAu8
	JZkNYka/Jow6cMF13WGwdUFZp3U8gYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-qafDTeBZPq2JaU6uXVtivQ-1; Mon, 14 Dec 2020 09:02:35 -0500
X-MC-Unique: qafDTeBZPq2JaU6uXVtivQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C536C10509F5;
	Mon, 14 Dec 2020 14:02:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A0260BE2;
	Mon, 14 Dec 2020 14:02:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 618D14BB40;
	Mon, 14 Dec 2020 14:02:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BEE2Ovs016903 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 09:02:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22D5F1002C10; Mon, 14 Dec 2020 14:02:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E684F100164C;
	Mon, 14 Dec 2020 14:02:20 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCAAD18095FF;
	Mon, 14 Dec 2020 14:02:20 +0000 (UTC)
Date: Mon, 14 Dec 2020 09:02:18 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <921985709.35517993.1607954538874.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201214085442.45467-8-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
	<20201214085442.45467-8-agruenba@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.65, 10.4.195.3]
Thread-Topic: gfs2: Get rid of on-stack transactions
Thread-Index: RMi/Fsm56HNQkl+DRhxQtw6SesFYcA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 07/12] gfs2: Get rid of on-stack
 transactions
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

----- Original Message -----
> +	ret = __gfs2_trans_begin(sdp, 0, revokes, GFP_NOFS | __GFP_NOFAIL);

The addition of __GFP_NOFAIL means that this operation can now block.
Looking at the code, I don't think it will be a problem because it can
already block in the log_flush operations that precede it, but it
makes me nervous. Obviously, we need to test this really well.

Bob

