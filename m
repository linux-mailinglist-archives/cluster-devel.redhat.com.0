Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A83F3EB183
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Aug 2021 09:30:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-xq9iofotNp6lLcfKsNK5Bg-1; Fri, 13 Aug 2021 03:30:13 -0400
X-MC-Unique: xq9iofotNp6lLcfKsNK5Bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C2C2E75;
	Fri, 13 Aug 2021 07:30:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FF8510016FF;
	Fri, 13 Aug 2021 07:30:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A37344BB7C;
	Fri, 13 Aug 2021 07:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17D7U54H020563 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Aug 2021 03:30:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9F6B20A3D58; Fri, 13 Aug 2021 07:30:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A52CD20A3D56
	for <cluster-devel@redhat.com>; Fri, 13 Aug 2021 07:30:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF04101A52C
	for <cluster-devel@redhat.com>; Fri, 13 Aug 2021 07:30:03 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-426-geqnWmqoMUiq_xRt1SOEYQ-1;
	Fri, 13 Aug 2021 03:29:59 -0400
X-MC-Unique: geqnWmqoMUiq_xRt1SOEYQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 958DD6736F; Fri, 13 Aug 2021 09:29:55 +0200 (CEST)
Date: Fri, 13 Aug 2021 09:29:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210813072955.GA27278@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<20210811003118.GT3601466@magnolia> <20210811053856.GA1934@lst.de>
	<20210811191708.GF3601443@magnolia> <20210812064914.GA27145@lst.de>
	<20210812182017.GX3601466@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210812182017.GX3601466@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 11/30] iomap: add the new iomap_iter
	model
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

On Thu, Aug 12, 2021 at 11:20:17AM -0700, Darrick J. Wong wrote:
> The history of the gluecode that enables us to walk a bunch of extent
> mappings.  In the beginning it was the _apply function, but now in our
> spectre-weary world, you've switched it to a direct loop to reduce the
> number of indirect calls in the hot path by 30-50%.
> 
> As you correctly point out, there's no /code/ shared by the two
> implementations, but Dave and I would like to preserve the continuity
> from one to the next.
> 
> > > I'll send the updated patches as replies to this series to avoid
> > > spamming the list, since I also have a patchset of bugfixes to send out
> > > and don't want to overwhelm everyone.
> > 
> > Just as a clear statement:  I think this dance is obsfucation and doesn't
> > help in any way.  But if that's what it takes..
> 
> I /would/ appreciate it if you'd rvb (or at least ack) patch 31 so I can
> get the 5.15 iomap changes finalized next week.  Pretty please? :)

I think it is a really stupid idea, so certainly no rvb or ack from me.
If you feel you want to do it this way go ahead, but I do not in any
way approve of it.

