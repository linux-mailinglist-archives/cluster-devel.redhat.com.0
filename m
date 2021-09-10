Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49A984067D9
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Sep 2021 09:40:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-BMafM0ZrOMq172yh_oGUeQ-1; Fri, 10 Sep 2021 03:40:00 -0400
X-MC-Unique: BMafM0ZrOMq172yh_oGUeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BD001808313;
	Fri, 10 Sep 2021 07:39:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6A31001281;
	Fri, 10 Sep 2021 07:39:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3E234EA2A;
	Fri, 10 Sep 2021 07:39:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18A7diLW020250 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 03:39:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1610B2102BFD; Fri, 10 Sep 2021 07:39:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 105A92102BEE
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 07:39:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EB53886482
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 07:39:41 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-392-DEsRQX7BOjq5CC8pIzti7A-1; Fri, 10 Sep 2021 03:39:39 -0400
X-MC-Unique: DEsRQX7BOjq5CC8pIzti7A-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mOb5g-00An2r-Uc; Fri, 10 Sep 2021 07:37:21 +0000
Date: Fri, 10 Sep 2021 08:36:52 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YTsLFKtUWPNcFo9c@infradead.org>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-17-agruenba@redhat.com>
	<YTnwZU8Q0eqBccmM@infradead.org>
	<CAHk-=wgF7TPaumMU6HjBjawjFWjvEg=116=gtnzsxAcfdP4wAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgF7TPaumMU6HjBjawjFWjvEg=116=gtnzsxAcfdP4wAw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 16/19] iomap: Add done_before
	argument to iomap_dio_rw
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 09, 2021 at 10:22:56AM -0700, Linus Torvalds wrote:
> I think you misunderstand.
> 
> Or maybe I do.
> 
> It very much doesn't force sync in this case. It did the *first* part
> of it synchronously, but then it wants to continue with that async
> part for the rest, and very much do that async completion.
> 
> And that's why it wants to add that "I already did X much of the
> work", exactly so that the async completion can report the full end
> result.

Could be, and yes in that case it won't work.

