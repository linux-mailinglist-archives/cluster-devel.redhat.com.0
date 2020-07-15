Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9D82201FA
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jul 2020 03:47:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-W632_LhtOWOV6iNYBZflrQ-1; Tue, 14 Jul 2020 21:47:56 -0400
X-MC-Unique: W632_LhtOWOV6iNYBZflrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95671106B244;
	Wed, 15 Jul 2020 01:47:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 977A160CD0;
	Wed, 15 Jul 2020 01:47:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA0B094F0F;
	Wed, 15 Jul 2020 01:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F1lgE6009231 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 21:47:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B49D42157F26; Wed, 15 Jul 2020 01:47:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0AC62166B27
	for <cluster-devel@redhat.com>; Wed, 15 Jul 2020 01:47:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADE03100E7C6
	for <cluster-devel@redhat.com>; Wed, 15 Jul 2020 01:47:40 +0000 (UTC)
Received: from mail107.syd.optusnet.com.au (mail107.syd.optusnet.com.au
	[211.29.132.53]) by relay.mimecast.com with ESMTP id
	us-mta-460-ZOhvo3NGOga29rMF-TY5NA-1; Tue, 14 Jul 2020 21:47:38 -0400
X-MC-Unique: ZOhvo3NGOga29rMF-TY5NA-1
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
	[49.180.53.24])
	by mail107.syd.optusnet.com.au (Postfix) with ESMTPS id CDEB3D5A5FF;
	Wed, 15 Jul 2020 11:47:35 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1jvWWE-0001ob-2Y; Wed, 15 Jul 2020 11:47:34 +1000
Date: Wed, 15 Jul 2020 11:47:34 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200715014734.GE2005@dread.disaster.area>
References: <20200713074633.875946-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200713074633.875946-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
	a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8
	a=GT6RCiLZAcxHUuuf7VQA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: iomap write invalidation
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2020 at 09:46:31AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series has two parts:  the first one picks up Dave's patch to avoid
> invalidation entierly for reads, picked up deep down from the btrfs iomap
> thread.  The second one falls back to buffered writes if invalidation fails
> instead of leaving a stale cache around.  Let me know what you think about
> this approch.

Either we maintain application level concurrency for direct IOs and
ignore the stale data in the page cache, or we kill application IO
concurrency and keep the page cache coherent.

It's a lose-lose choice and I'm on the fence as to which is the
lesser of two evils.

The main factor is whether the buffered IO fallback can be
diagnosed. There's a new tracepoint for that case, so at least we
will be able to tell if the fallback co-incides with application
performance cratering. Hopefully this will only be a rare event.

So, to hoist myself on my own petard: correctness first, performance
second.

Acked-by: Dave Chinner <dchinner@redhat.com>

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

