Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BBC131E6923
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 20:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590689550;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xl7zma91zH9/15pilUbw+f8TXJ0a/cvCc4fmYZUg3i0=;
	b=ROL3ALJBoQfEXXQNPLdsGM6Uz4crvnZCspERHAq+rfBBZ6lHTwMB4LgaO/yo5QJEEDeFL3
	/+2gQ49f9uZtsUZxqYXu4hY/Sw8tJMFiOiB8PxP3/DJKn/WsIGp/Ku3n0N7+YMuITj0bFG
	RLrM6efIylQO1G600uwo9v6fYZLmzfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-dEMj5LrcMLWnF0jgVqdhEA-1; Thu, 28 May 2020 14:12:27 -0400
X-MC-Unique: dEMj5LrcMLWnF0jgVqdhEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80036461;
	Thu, 28 May 2020 18:12:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BE62A1038;
	Thu, 28 May 2020 18:12:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1A146B546;
	Thu, 28 May 2020 18:12:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04SICGjg030420 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 14:12:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EC2B2018290; Thu, 28 May 2020 18:12:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91615201828F
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 18:12:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8FC68007A4
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 18:12:13 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-424-BPb-UsshO86ZRHH8S5M0_g-1; Thu, 28 May 2020 14:12:11 -0400
X-MC-Unique: BPb-UsshO86ZRHH8S5M0_g-1
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 8FA40129191D0;
	Thu, 28 May 2020 11:12:06 -0700 (PDT)
Date: Thu, 28 May 2020 11:12:05 -0700 (PDT)
Message-Id: <20200528.111205.608949763790224771.davem@davemloft.net>
To: hch@lst.de
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Thu, 28 May 2020 11:12:07 -0700 (PDT)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	cluster-devel@redhat.com, yoshfuji@linux-ipv6.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, jmaloy@redhat.com,
	drbd-dev@tron.linbit.com, edumazet@google.com,
	target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	kuznet@ms2.inr.ac.ru, ying.xue@windriver.com, kuba@kernel.org,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-rdma@vger.kernel.org
Subject: Re: [Cluster-devel] remove most callers of kernel_setsockopt v3
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
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>
Date: Thu, 28 May 2020 07:12:08 +0200

> this series removes most callers of the kernel_setsockopt functions, and
> instead switches their users to small functions that implement setting a
> sockopt directly using a normal kernel function call with type safety and
> all the other benefits of not having a function call.
> 
> In some cases these functions seem pretty heavy handed as they do
> a lock_sock even for just setting a single variable, but this mirrors
> the real setsockopt implementation unlike a few drivers that just set
> set the fields directly.
 ...

Series applied, thanks Christoph.

