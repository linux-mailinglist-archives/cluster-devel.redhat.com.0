Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD87C3DFFA6
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Aug 2021 12:53:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-MDQlEd3EMtauapSjjTQB2Q-1; Wed, 04 Aug 2021 06:53:09 -0400
X-MC-Unique: MDQlEd3EMtauapSjjTQB2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 198538912ED;
	Wed,  4 Aug 2021 10:52:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF9A5E7A2;
	Wed,  4 Aug 2021 10:52:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6471181A3ED;
	Wed,  4 Aug 2021 10:52:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1745u1PY012815 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 01:56:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D89D7AF5; Wed,  4 Aug 2021 05:56:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F3BE7789
	for <cluster-devel@redhat.com>; Wed,  4 Aug 2021 05:55:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E34D789C7DB
	for <cluster-devel@redhat.com>; Wed,  4 Aug 2021 05:55:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-402-4-Jjx3PQPUKPBLqTRO70LQ-1;
	Wed, 04 Aug 2021 01:55:56 -0400
X-MC-Unique: 4-Jjx3PQPUKPBLqTRO70LQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DBC260F35;
	Wed,  4 Aug 2021 05:47:39 +0000 (UTC)
Date: Wed, 4 Aug 2021 08:47:36 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Yajun Deng <yajun.deng@linux.dev>
Message-ID: <YQop+GhJcKICdwZ0@unreal>
References: <20210804032856.4005-1-yajun.deng@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210804032856.4005-1-yajun.deng@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Aug 2021 06:50:56 -0400
Cc: linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	mathew.j.martineau@linux.intel.com, linux-kernel@vger.kernel.org,
	davem@davemloft.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, mptcp@lists.linux.dev,
	matthieu.baerts@tessares.net, kuba@kernel.org,
	bpf@vger.kernel.org, anna.schumaker@netapp.com,
	trond.myklebust@hammerspace.com
Subject: Re: [Cluster-devel] [PATCH net-next v2] net: Modify
 sock_set_keepalive() for more scenarios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2021 at 11:28:56AM +0800, Yajun Deng wrote:
> Add 2nd parameter in sock_set_keepalive(), let the caller decide
> whether to set. This can be applied to more scenarios.
> 
> v2:
>  - add the change in fs/dlm.
> 
> Signed-off-by: Yajun Deng <yajun.deng@linux.dev>
> ---
>  fs/dlm/lowcomms.c     |  2 +-
>  include/net/sock.h    |  2 +-
>  net/core/filter.c     |  4 +---
>  net/core/sock.c       | 10 ++++------
>  net/mptcp/sockopt.c   |  4 +---
>  net/rds/tcp_listen.c  |  2 +-
>  net/smc/af_smc.c      |  2 +-
>  net/sunrpc/xprtsock.c |  2 +-
>  8 files changed, 11 insertions(+), 17 deletions(-)

1. Don't add changelogs in the commit messages and put them under --- marker.
2. Add an explanation to the commit message WHY this change is necessary
and HOW will it be used.
3. Drop all your double NOT in front of values (!!val) and rely on C
that casts int to bool naturally.

Thanks

