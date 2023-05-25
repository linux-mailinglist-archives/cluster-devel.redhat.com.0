Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB6711874
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 22:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685047859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WmfPfoS4jj9y7WKgyiPfXOC2ErdWT8XZ/X5AqeuiIvY=;
	b=U+zmN4J6kFxIRDMkafGNNcUpUBiihjIF/51OqZloSug2lUuWiFBVDYmzQVOqT3EJGiQmHc
	SxF6Nq9pb4EGnQfEq4wtXLyY73yMqm/doYd7pfjUpytiF96S14l8xe7OMqxlLhCo1E5drr
	Iy4baY4pgkXH42OlqKAr7q6rfTHELHI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164--yXPeXM9MTieaORRLViPWg-1; Thu, 25 May 2023 16:50:52 -0400
X-MC-Unique: -yXPeXM9MTieaORRLViPWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC7B7185A78E;
	Thu, 25 May 2023 20:50:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35A0D140E95D;
	Thu, 25 May 2023 20:50:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E1D7419465B1;
	Thu, 25 May 2023 20:50:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1565319465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 20:50:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ECC4CC154D2; Thu, 25 May 2023 20:50:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E54C8C154D1
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 20:50:49 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7303800141
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 20:50:49 +0000 (UTC)
Received: from out-37.mta0.migadu.com (out-37.mta0.migadu.com
 [91.218.175.37]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-fPd6iK8rMymfyfUVqsZ3RA-1; Thu, 25 May 2023 16:50:47 -0400
X-MC-Unique: fPd6iK8rMymfyfUVqsZ3RA-1
Date: Thu, 25 May 2023 16:50:39 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZG/KH9cQluA5e30N@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org> <ZGzrV5j7OUU6rYij@moria.home.lan>
 <ZG2yFFcpE7w/Glge@infradead.org> <ZG3GHoNnJJW4xX2H@moria.home.lan>
 <ZG8jJRcwtx3JQf6Q@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZG8jJRcwtx3JQf6Q@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 01:58:13AM -0700, Christoph Hellwig wrote:
> On Wed, May 24, 2023 at 04:09:02AM -0400, Kent Overstreet wrote:
> > > Well, it seems like you are talking about something else than the
> > > existing cases in gfs2 and btrfs, that is you want full consistency
> > > between direct I/O and buffered I/O.  That's something nothing in the
> > > kernel has ever provided, so I'd be curious why you think you need it
> > > and want different semantics from everyone else?
> > 
> > Because I like code that is correct.
> 
> Well, start with explaining your definition of correctness, why everyone
> else is "not correct", an how you can help fixing this correctness
> problem in the existing kernel.  Thanks for your cooperation!

A cache that isn't actually consistent is a _bug_. You're being
Obsequious. And any time this has come up in previous discussions
(including at LSF), that was never up for debate, the only question has
been whether it was even possible to practically fix it.

The DIO code recognizes cache incoherency as something to be avoided by
shooting down the page cache both at the beginning of the IO _and again
at the end_.  That's the kind of obvious hackery for a race condition
that we would like to avoid.

Regarding the consequences of this kind of bug - stale data exposed to
userspace, possibly stale data overwriting a write we acked, and worse
any filesystem state that hangs off the page cache being inconsistent
with the data on disk.

And look, we've been over all this before, so I don't see what this adds
to the discussion.

