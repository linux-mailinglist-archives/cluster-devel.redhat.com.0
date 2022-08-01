Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AB586F04
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Aug 2022 18:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659372686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=vQCGuIanIjFTeXrqhqN+Uxy55c+p5UePXfr7CwbLB6M=;
	b=a4B8zOazMWP0h79beUbHLW4YnqnvYyL6L27PM1yxRL47hAOLma2TBCJZ17YRwd954zlE2K
	ekaPlTUeqmmIUK6srgkQhsZ/5phW+wJ/Bjht/1DpU+7+ftEb1tVjHGvgHuxmX0nEYBZqWH
	p4uU48CMTKB1O6s4ekXh13MhX3Q4H4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-yKlzK_2cOAiNDrzF19bLQQ-1; Mon, 01 Aug 2022 12:51:23 -0400
X-MC-Unique: yKlzK_2cOAiNDrzF19bLQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1B9811E76;
	Mon,  1 Aug 2022 16:51:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD6FC28100;
	Mon,  1 Aug 2022 16:51:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 675431946A47;
	Mon,  1 Aug 2022 16:51:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B92091946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 Aug 2022 16:51:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 950C4401E5C; Mon,  1 Aug 2022 16:51:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 617C3492C3B;
 Mon,  1 Aug 2022 16:51:17 +0000 (UTC)
Date: Mon, 1 Aug 2022 11:51:16 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20220801165115.GC12328@redhat.com>
References: <20220801144329.GA10643@redhat.com>
 <CAHk-=wgCi2LLzSJg_7nRs+nQbVgT8HwEKzjMae_4geVCA+1SNg@mail.gmail.com>
 <20220801155028.GA12328@redhat.com>
 <20220801155624.GB12328@redhat.com>
 <CAHk-=wi07ue68JuYXDdPD-s93UTs0Tp0oAvdnyxS3zQQSosEOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wi07ue68JuYXDdPD-s93UTs0Tp0oAvdnyxS3zQQSosEOA@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [GIT PULL] dlm updates for 6.0
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 01, 2022 at 09:17:30AM -0700, Linus Torvalds wrote:
> But again: please don't rebase stuff you have already exposed to
> others. It causes real issues. This was just one example of it.
> 
> And if you *do* have to rebase for a real technical reason ("Oh, that
> was a disaster, it absolutely *must* be fixed"), please let involved
> people know asap.
> 
> And a version number change is not a "huge disaster, must rebase".

Yep, thanks for the comments. For some reason this escaped the usual flags
that should have gone off in my head about rebasing.

Dave

