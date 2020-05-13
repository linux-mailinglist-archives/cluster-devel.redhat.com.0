Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7881D133B
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 14:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589374323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I21hL7AkwUgdNPUI4l7KTQwvXQoa/NOyWUo4IiS5Zaw=;
	b=bwAsg5ASy6gUXcIRJmAgtEl3ByaWTVA1HArh3UJw5berHyuuBdysTo/BO7E0AEjxEU97fI
	7swHUJwhOHhSBHbeu0E73MjOdCsfybQpT797gN+8M/S41VynGY///EsLPO2PkqybiEEf/b
	kCRacdM2j6VJ/DNaPnFOwNVdf+5JgGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-K5lYODTpPfaWokQZpnBOcQ-1; Wed, 13 May 2020 08:52:01 -0400
X-MC-Unique: K5lYODTpPfaWokQZpnBOcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA8D107ACF2;
	Wed, 13 May 2020 12:51:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 499CA783B3;
	Wed, 13 May 2020 12:51:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD2234CAA0;
	Wed, 13 May 2020 12:51:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DCpoDU021664 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 08:51:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28D1F117908; Wed, 13 May 2020 12:51:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2211F11791E
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 12:51:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E52C01049885
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 12:51:47 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-j9CPkVyWMNuu2tDcbw5QfQ-1; Wed, 13 May 2020 08:51:45 -0400
X-MC-Unique: j9CPkVyWMNuu2tDcbw5QfQ-1
Received: by mail-qk1-f194.google.com with SMTP id n14so17119208qke.8
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 05:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I21hL7AkwUgdNPUI4l7KTQwvXQoa/NOyWUo4IiS5Zaw=;
	b=P9JNFIa43qeRuoE1Ae6t4FnQLRGMFJdW2ocwGaHFIsIgSGCxy/WXe+2sSdkQkASqjK
	q1jLCuLRCNZaVtrZUXF8jn8/Mx+FYggRkL9J0Aw96zbFnoppxpXnDYzzvxMLMF4GQfji
	2iT0vjtn3tExJve/3I/A80GHaOo99fFGzbqvxISoXmyy7yjsEOMzbJY17Cdt6/lZk1z/
	O26saUJ67Smrc4N1uu/2/Kj6Z49Dpsk0m23ZkDggqFmlgbn9YDPRLNo8WDxP2hf4s2MI
	uKhweMqWkeAFlbK2HNU4CDrmhzO6mIQ3YDcNAIX8ddgqV7+Cy/b6udeWYgrAvJlZvxi/
	60RQ==
X-Gm-Message-State: AGi0Pua4lljxUx3vkHPAgb4flgZAh9c4fRxybxDt2Zdk9HLRHzNVpk3J
	cdFu0wJ+ofaJNZUjGHq1Otnb8Q==
X-Google-Smtp-Source: APiQypKy6izjhUbivG+/I6PWV8eR0peu4dabx2HIoItXGvYLmzKEIJJmSlJIMmuJWfJIdDxUx9gC8w==
X-Received: by 2002:a37:61d8:: with SMTP id
	v207mr26564281qkb.146.1589374305465; 
	Wed, 13 May 2020 05:51:45 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.48.30]) by smtp.gmail.com with ESMTPSA id
	t67sm13779002qka.17.2020.05.13.05.51.44
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 May 2020 05:51:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jYqrQ-0008K6-D9; Wed, 13 May 2020 09:51:44 -0300
Date: Wed, 13 May 2020 09:51:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200513125144.GC29989@ziepe.ca>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-12-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200513062649.2100053-12-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 11/33] tcp: tcp_sock_set_nodelay
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 08:26:26AM +0200, Christoph Hellwig wrote:
> Add a helper to directly set the TCP_NODELAY sockopt from kernel space
> without going through a fake uaccess.  Cleanup the callers to avoid
> pointless wrappers now that this is a simple function call.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/drbd/drbd_int.h             |  7 ----
>  drivers/block/drbd/drbd_main.c            |  2 +-
>  drivers/block/drbd/drbd_receiver.c        |  4 +--
>  drivers/infiniband/sw/siw/siw_cm.c        | 24 +++-----------
>  drivers/nvme/host/tcp.c                   |  9 +-----
>  drivers/nvme/target/tcp.c                 | 12 ++-----
>  drivers/target/iscsi/iscsi_target_login.c | 15 ++-------
>  fs/cifs/connect.c                         | 10 ++----
>  fs/dlm/lowcomms.c                         |  8 ++---
>  fs/ocfs2/cluster/tcp.c                    | 20 ++----------
>  include/linux/tcp.h                       |  1 +
>  net/ceph/messenger.c                      | 11 ++-----
>  net/ipv4/tcp.c                            | 39 +++++++++++++++--------
>  net/rds/tcp.c                             | 11 +------
>  net/rds/tcp.h                             |  1 -
>  net/rds/tcp_listen.c                      |  2 +-
>  16 files changed, 49 insertions(+), 127 deletions(-)

No problem with the siw change

Acked-by: Jason Gunthorpe <jgg@mellanox.com>

Jason

