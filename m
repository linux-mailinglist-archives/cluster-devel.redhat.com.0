Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D472BF5
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 12:02:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 491508CB4B;
	Wed, 24 Jul 2019 10:02:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E9E15D721;
	Wed, 24 Jul 2019 10:02:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D115E1800206;
	Wed, 24 Jul 2019 10:02:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OA2AeS011260 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 06:02:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 802EF60BF7; Wed, 24 Jul 2019 10:02:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76B7460BF3;
	Wed, 24 Jul 2019 10:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B54AF30C1D12;
	Wed, 24 Jul 2019 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F2oEMCtw8YeaynQj1iROf/Z79JmqO/tj/EENj3lNIeY=;
	b=O5IApRcwK8M7nqPA7BsVPNJHy
	FblZ1nXxsSc0DeNyb1SWIBmg+mBaPMjR2KiTJKmREkdAWsl3ghYM2FGl/FW/2Q7OWj/nWNVNZ6PRS
	2fcC5OcEdCIUKcNH6zTvTU8uYNn48Lx6b62Xm5XvTv4iKGCxD72m3WsHA5APKr+Cssa0lO+LT/5BP
	kEqJadJ2n2rAToE/Dy+aXljflOYH042RKTTbeGgz9PF48miLc0qkWdLMnPeSFxKsK0L/PTAzYbID1
	PNUOoMsDhQwgPiIkOaX3HlqjtHPMDLhqLPwkQhmNpl6YcLk8+s2ws/OjbXXeRcnEBoMJkcyerDCpE
	3YAFhtRNg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hqE63-0002De-Es; Wed, 24 Jul 2019 10:02:07 +0000
Date: Wed, 24 Jul 2019 03:02:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <20190724100207.GA7916@infradead.org>
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
	<2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Wed, 24 Jul 2019 10:02:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 24 Jul 2019 10:02:07 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+1e4efd27347a199fee4d+5813+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+1e4efd27347a199fee4d+5813+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 24 Jul 2019 10:02:12 +0000 (UTC)

On Wed, Jul 24, 2019 at 09:48:38AM +0100, Steven Whitehouse wrote:
> Hi,
> 
> On 24/07/2019 09:43, Jia-Ju Bai wrote:
> > In gfs2_alloc_inode(), when kmem_cache_alloc() on line 1724 returns
> > NULL, ip is assigned to NULL. In this case, "return &ip->i_inode" will
> > cause a null-pointer dereference.
> > 
> > To fix this null-pointer dereference, NULL is returned when ip is NULL.
> > 
> > This bug is found by a static analysis tool STCheck written by us.
> 
> The bug is in the tool I'm afraid. Since i_inode is the first element of ip,
> there is no NULL dereference here. A pointer to ip->i_inode and a pointer to
> ip are one and the same (bar the differing types) which is the reason that
> we return &ip->i_inode rather than just ip,

But that doesn't help if ip is NULL, as dereferencing a field in in
still remains invalid behavior.

