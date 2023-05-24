Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D344970F069
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 10:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684916130;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PkhXh/TNyeXnNZOI/g5bdL7/bZLBDieBo7l7auFehJY=;
	b=Ke7F9BBDkJuoAzgFbNmetUVQAog7T1yIe9peRw28IyuAlV0n8D5FpZ/Qfun5EAOIlRdSgn
	SJ1RGkV8NdFXfR4Pobs7lQ55aD3eVLIrE8WoOoRX7Vtm09TGTarwboA/5JCFp8loDHHcx0
	uW5UcII6SgGP/wkVdmS05wkbTwiQr7Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Lnu6aL4cPLWAaRnDHibE8Q-1; Wed, 24 May 2023 04:15:26 -0400
X-MC-Unique: Lnu6aL4cPLWAaRnDHibE8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9E628007D9;
	Wed, 24 May 2023 08:15:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 543787AE4;
	Wed, 24 May 2023 08:15:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DF6C19465B3;
	Wed, 24 May 2023 08:15:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8FCB319465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 08:15:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 73207492B0B; Wed, 24 May 2023 08:15:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB87492B0A
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 08:15:22 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECF7380213E
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 08:15:22 +0000 (UTC)
Received: from out-17.mta1.migadu.com (out-17.mta1.migadu.com
 [95.215.58.17]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-SYkyjIZVOwaCjL5kyyzXkA-1; Wed, 24 May 2023 04:15:20 -0400
X-MC-Unique: SYkyjIZVOwaCjL5kyyzXkA-1
Date: Wed, 24 May 2023 04:09:02 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZG3GHoNnJJW4xX2H@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org> <ZGzrV5j7OUU6rYij@moria.home.lan>
 <ZG2yFFcpE7w/Glge@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZG2yFFcpE7w/Glge@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 11:43:32PM -0700, Christoph Hellwig wrote:
> On Tue, May 23, 2023 at 12:35:35PM -0400, Kent Overstreet wrote:
> > No, this is fundamentally because userspace controls the ordering of
> > locking because the buffer passed to dio can point into any address
> > space. You can't solve this by changing the locking heirarchy.
> > 
> > If you want to be able to have locking around adding things to the
> > pagecache so that things that bypass the pagecache can prevent
> > inconsistencies (and we do, the big one is fcollapse), and if you want
> > dio to be able to use that same locking (because otherwise dio will also
> > cause page cache inconsistency), this is the way to do it.
> 
> Well, it seems like you are talking about something else than the
> existing cases in gfs2 and btrfs, that is you want full consistency
> between direct I/O and buffered I/O.  That's something nothing in the
> kernel has ever provided, so I'd be curious why you think you need it
> and want different semantics from everyone else?

Because I like code that is correct.

