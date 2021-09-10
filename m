Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2D14D4067FB
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Sep 2021 09:47:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-FJkSbKUuPwOwoYU6Ltz6sQ-1; Fri, 10 Sep 2021 03:47:48 -0400
X-MC-Unique: FJkSbKUuPwOwoYU6Ltz6sQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C7B1808307;
	Fri, 10 Sep 2021 07:47:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFBD5C23A;
	Fri, 10 Sep 2021 07:47:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B6544EA29;
	Fri, 10 Sep 2021 07:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18A7kd5e020632 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 03:46:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF4391B1D4B; Fri, 10 Sep 2021 07:46:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9B591B1D40
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 07:46:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8476800B29
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 07:46:36 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-u90XxCDxOpisbiz6VoS8eA-1; Fri, 10 Sep 2021 03:46:35 -0400
X-MC-Unique: u90XxCDxOpisbiz6VoS8eA-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mOatG-00AmTN-Ld; Fri, 10 Sep 2021 07:24:19 +0000
Date: Fri, 10 Sep 2021 08:24:02 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YTsIEqoJqRUVneHq@infradead.org>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-18-agruenba@redhat.com>
	<YTnxruxm/xA/BBmQ@infradead.org>
	<CAHk-=wj4RER3XeG34nLH2PgvuRuj_NRgDx=wLTKv=jYaQnFe+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj4RER3XeG34nLH2PgvuRuj_NRgDx=wLTKv=jYaQnFe+Q@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 17/19] gup: Introduce FOLL_NOFAULT
 flag to disable page faults
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 09, 2021 at 10:17:14AM -0700, Linus Torvalds wrote:
> So I think we should treat FOLL_FAST_ONLY as a special "internal to
> gup.c" flag, and perhaps not really compare it to the new
> FOLL_NOFAULT.
> 
> In fact, maybe we could even just make FOLL_FAST_ONLY be the high bit,
> and not expose it in <linux/mm.h> and make it entirely private as a
> name in gup.c.

There are quite a few bits like that.  I've been wanting to make them
private for 5.16.

