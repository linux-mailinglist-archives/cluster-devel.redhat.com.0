Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D56B3522
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 05:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678421134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sXO3jdqVtcE9IkmkZO6INMTY092zGfYbJtv9fnxM+sA=;
	b=EUN4qdETOweQo4+RdSh8or/VK92aeT4YKCFPyWfrhKi5C8G4UxeLMbaxcEfm5jwtjd9ZEO
	yEz9Jg2b+ZC582hbauTLPp9E8bHRas62oUsyAHBhTo5m79qu+IBOa/k7pxf9+kHH93IHqI
	yyU/FiR7Aj1vEp75+iKzpk8V86Ue1qM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-S5R7yO7wPkmnyHTnq4WD8w-1; Thu, 09 Mar 2023 23:05:31 -0500
X-MC-Unique: S5R7yO7wPkmnyHTnq4WD8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E5DD3C021B2;
	Fri, 10 Mar 2023 04:05:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D43951121330;
	Fri, 10 Mar 2023 04:05:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9740C1946A49;
	Fri, 10 Mar 2023 04:05:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 896C11946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 04:05:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 679981121331; Fri, 10 Mar 2023 04:05:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C03112132D
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 04:05:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42D52800B23
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 04:05:28 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-Swou88rHMjmcrzLELpoptQ-1; Thu,
 09 Mar 2023 23:05:23 -0500
X-MC-Unique: Swou88rHMjmcrzLELpoptQ-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1paU0C-00FCuh-1q; Fri, 10 Mar 2023 04:05:08 +0000
Date: Fri, 10 Mar 2023 04:05:08 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230310040508.GN3390869@ZenIV>
References: <20230310031547.GD3390869@ZenIV>
 <20230310035121.56591-1-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230310035121.56591-1-frank.li@vivo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] erofs: convert to use i_blockmask()
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
Cc: brauner@kernel.org, tytso@mit.edu, joseph.qi@linux.alibaba.com,
 mark@fasheh.com, chao@kernel.org, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, huyue2@coolpad.com, adilger.kernel@dilger.ca,
 jlbec@evilplan.org, jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 xiang@kernel.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 10, 2023 at 11:51:21AM +0800, Yangtao Li wrote:
> Hi AI,
> 
> > Umm...  What's the branchpoint for that series?
> > Not the mainline - there we have i_blocksize() open-coded...
> 
> Sorry, I'm based on the latest branch of the erofs repository.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/log/?h=dev-test
> 
> I think I can resend based on mainline.
> 
> > Umm...  That actually asks for DIV_ROUND_UP(i_size_read_inode(), i_blocksize(inode))
> > - compiler should bloody well be able to figure out that division by (1 << n)
> > is shift down by n and it's easier to follow that way...
> 
> So it seems better to change to DIV_ROUND_UP(i_size_read_inode(), i_blocksize(inode))?
> 
> > And the fact that the value will be the same (i.e. that ->i_blkbits is never changed by ocfs2)
> > is worth mentioning in commit message...
> 
> How about the following msg?
> 
> Use i_blockmask() to simplify code. BTW convert ocfs2_is_io_unaligned
> to return bool type and the fact that the value will be the same
> (i.e. that ->i_blkbits is never changed by ocfs2).
> 
> 
> 
> A small question, whether this series of changes will be merged
> into each fs branch or all merged into vfs?

Depends.  The thing to avoid is conflicts between the trees and
convoluted commit graph.

In cases like that the usual approach is
	* put the helper into never-rebased branch - in vfs tree, in this
case; I've no real objections against the helper in question.
	* let other trees convert to the helper at leisure - merging
that never-rebased branch from vfs.git before they use the helper, of
course.  Or wait until the next cycle, for that matter...

I can pick the stuff in the areas that don't have active development,
but doing that for e.g. ext4 won't help anybody - it would only cause
headache for everyone involved down the road.  And I'd expect the gfs2
to be in the same situation...

