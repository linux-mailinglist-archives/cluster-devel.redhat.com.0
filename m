Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9871E1D3EC2
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 22:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589487175;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sx2vFTE1J+qFeS4XEHWrcAg5fVuo1lfDc1D+9AH2LnE=;
	b=XWZRUcrPbAKPV0fmhK7YXmsBEJWHMIuCLPUFaPPiUIaK2F8lALiProLx4XzWcNu9DJSF8S
	Y47NHFVxA2WYS08PE2TmfBlYQybwJFI9mmD6FBZ2EC9iYElanizcbyL+eSZRuvrVg5RIFn
	GhGYvwZEuTsGSJlc/buOXv+RJNUUgCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-p1GqLg0SOdiThA1Nt-_Gww-1; Thu, 14 May 2020 16:12:53 -0400
X-MC-Unique: p1GqLg0SOdiThA1Nt-_Gww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BCCC80183C;
	Thu, 14 May 2020 20:12:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B8251059115;
	Thu, 14 May 2020 20:12:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB0AA1809541;
	Thu, 14 May 2020 20:12:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EKCjwb005048 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 16:12:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3454D1065C6C; Thu, 14 May 2020 20:12:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC881065C75
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 20:12:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E40B85CE74
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 20:04:03 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-197-5NaTlwhLMR6hQZxROx9jIg-1; Thu, 14 May 2020 16:04:00 -0400
X-MC-Unique: 5NaTlwhLMR6hQZxROx9jIg-1
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 44DE4128D4959;
	Thu, 14 May 2020 13:03:58 -0700 (PDT)
Date: Thu, 14 May 2020 13:03:57 -0700 (PDT)
Message-Id: <20200514.130357.1683454520750761365.davem@davemloft.net>
To: David.Laight@ACULAB.COM
From: David Miller <davem@davemloft.net>
In-Reply-To: <a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
References: <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
	<20200514101838.GA12548@lst.de>
	<a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Thu, 14 May 2020 13:03:59 -0700 (PDT)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: marcelo.leitner@gmail.com, linux-nvme@lists.infradead.org,
	edumazet@google.com, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, hch@lst.de,
	cluster-devel@redhat.com, kuznet@ms2.inr.ac.ru,
	linux-block@vger.kernel.org, joe@perches.com, kuba@kernel.org,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
	yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	jmaloy@redhat.com, linux-sctp@vger.kernel.org,
	ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] remove kernel_setsockopt and kernel_getsockopt
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
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 14 May 2020 10:26:41 +0000

> I doubt we are the one company with out-of-tree drivers
> that use the kernel_socket interface.

Not our problem.

