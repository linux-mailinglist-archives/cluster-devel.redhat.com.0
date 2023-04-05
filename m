Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD346D8536
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 19:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680717061;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MRgvihe+1WyDTvsHn4M9QlfVv6sYj8QTdUgqotsbYXo=;
	b=dMigDvunAud2Jp7Jf+w5Je+c7Ln/Sx0vKr2vLDU0BwDRHOgyUmcG7D+l37i7ybr5LmMe/n
	wjZ89GQE6jcypgX/RYivJmb6KtEwCgMQmVctbi1ObTzLPJmHjfOCfY4cRWC2N+5wZboTv/
	6hXLJOPnumEdnFQkF1ZDZ39o0dNzaMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-gj_Wk6_yNxWky0OrcxtZMA-1; Wed, 05 Apr 2023 13:50:57 -0400
X-MC-Unique: gj_Wk6_yNxWky0OrcxtZMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4333E811E7C;
	Wed,  5 Apr 2023 17:50:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 453FA18EC7;
	Wed,  5 Apr 2023 17:50:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E89001946597;
	Wed,  5 Apr 2023 17:50:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 93D891946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 17:50:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2F1F8492C18; Wed,  5 Apr 2023 17:50:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E01492C14
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 17:50:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075E7185A790
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 17:50:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-78j_frO3P7mcGNwMJLMOvQ-1; Wed, 05 Apr 2023 13:50:50 -0400
X-MC-Unique: 78j_frO3P7mcGNwMJLMOvQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D5D663D5B;
 Wed,  5 Apr 2023 17:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EE0C433D2;
 Wed,  5 Apr 2023 17:50:48 +0000 (UTC)
Date: Wed, 5 Apr 2023 17:50:46 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZC209lS6vrEGqDhx@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
 <ZCxCnC2lM9N9qtCc@infradead.org>
 <20230405103642.ykmgjgb7yi7htphf@aalbersh.remote.csb>
 <ZC2X5YlHMxzZQzhx@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZC2X5YlHMxzZQzhx@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2 05/23] fsverity: make
 fsverity_verify_folio() accept folio's offset and size
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
Cc: fsverity@lists.linux.dev, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 08:46:45AM -0700, Christoph Hellwig wrote:
> On Wed, Apr 05, 2023 at 12:36:42PM +0200, Andrey Albershteyn wrote:
> > Hi Christoph,
> > 
> > On Tue, Apr 04, 2023 at 08:30:36AM -0700, Christoph Hellwig wrote:
> > > On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> > > > Not the whole folio always need to be verified by fs-verity (e.g.
> > > > with 1k blocks). Use passed folio's offset and size.
> > > 
> > > Why can't those callers just call fsverity_verify_blocks directly?
> > > 
> > 
> > They can. Calling _verify_folio with explicit offset; size appeared
> > more clear to me. But I'm ok with dropping this patch to have full
> > folio verify function.
> 
> Well, there is no point in a wrapper if it has the exact same signature
> and functionality as the functionality being wrapped.
> 
> That being said, right now fsverity_verify_folio, so it might make sense
> to either rename it, or rename fsverity_verify_blocks to
> fsverity_verify_folio.  But that's really a question for Eric.

I thought it would be confusing for fsverity_verify_folio() to not actually
verify a whole folio.  So, for now we have:

    fsverity_verify_page: verify a whole page
    fsverity_verify_folio: verify a whole folio
    fsverity_verify_blocks: verify a range of blocks in a folio

IMO that makes sense.  Note: fsverity_verify_folio() is currently unused, but
ext4 might use it.

So, just use fsverity_verify_blocks().

- Eric

