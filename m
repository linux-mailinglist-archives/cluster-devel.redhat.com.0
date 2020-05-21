Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0591DC7EB
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 09:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590047111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=E3GyhKojXVNo0Mooki74/Av48EK9IfzgPCl8v5tu8BM=;
	b=OHZHxrfyobyIrQ/IDyhxU62g/UKo93IEYHbijdromDvXqWVLt5HULqBrzBBlADGEy5mmOq
	kJrcfVdY9jT4NiQur+5xEGvzRzQ7mEAGJOVnb4/Ncqxr4L+6KC7ouTJL27aIkyuTkTuL3G
	mxO7Xl8K0mIsHIQCSyLn5ZNq5UVwUCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-gwLVxzclNjCbnP37esPOww-1; Thu, 21 May 2020 03:45:09 -0400
X-MC-Unique: gwLVxzclNjCbnP37esPOww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D813B8015D2;
	Thu, 21 May 2020 07:45:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0D160C81;
	Thu, 21 May 2020 07:45:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E8811809543;
	Thu, 21 May 2020 07:45:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04L7iKLe007602 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 03:44:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C2985C1D0; Thu, 21 May 2020 07:44:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
	[10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7135C1B0;
	Thu, 21 May 2020 07:44:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200520195509.2215098-30-hch@lst.de>
References: <20200520195509.2215098-30-hch@lst.de>
	<20200520195509.2215098-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <71190.1590047051.1@warthog.procyon.org.uk>
Date: Thu, 21 May 2020 08:44:11 +0100
Message-ID: <71191.1590047051@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	dhowells@redhat.com, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Jakub Kicinski <kuba@kernel.org>, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 29/33] rxrpc: add
	rxrpc_sock_set_min_security_level
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
Content-Type: text/plain; charset="us-ascii"

Christoph Hellwig <hch@lst.de> wrote:

> Add a helper to directly set the RXRPC_MIN_SECURITY_LEVEL sockopt from
> kernel space without going through a fake uaccess.
> 
> Thanks to David Howells for the documentation updates.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David Howells <dhowells@redhat.com>

