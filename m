Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF6586E0F
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Aug 2022 17:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659369035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=13WvCbM7YYWydZ4zqnGjgUjiZmMOLmVSuHX1e1KRlrs=;
	b=GVjT2t3VHypKhyQmlzXNFfDCFUxu0kDMYIWfxT9V5eTuVBIHYJ6hOX/CE4e4aPRcfF/1F8
	N1OFZrPhPW5GwYKlFiR4pRxQ/qfqWSqafNjPlfaPJf2APpKCp4QLQ9nBdCl+GUCe681Low
	uuND6JAXbKiSnZQvSZcoroIDDFn7xjk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-HnmAMxGRN76T1Oq_T-B4QQ-1; Mon, 01 Aug 2022 11:50:33 -0400
X-MC-Unique: HnmAMxGRN76T1Oq_T-B4QQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1914A3826A55;
	Mon,  1 Aug 2022 15:50:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D2521121314;
	Mon,  1 Aug 2022 15:50:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CD9481946A48;
	Mon,  1 Aug 2022 15:50:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 245461946A41 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 Aug 2022 15:50:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 18EF21121315; Mon,  1 Aug 2022 15:50:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA4861121314;
 Mon,  1 Aug 2022 15:50:29 +0000 (UTC)
Date: Mon, 1 Aug 2022 10:50:28 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20220801155028.GA12328@redhat.com>
References: <20220801144329.GA10643@redhat.com>
 <CAHk-=wgCi2LLzSJg_7nRs+nQbVgT8HwEKzjMae_4geVCA+1SNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgCi2LLzSJg_7nRs+nQbVgT8HwEKzjMae_4geVCA+1SNg@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 01, 2022 at 08:46:24AM -0700, Linus Torvalds wrote:
> On Mon, Aug 1, 2022 at 7:43 AM David Teigland <teigland@redhat.com> wrote:
> >
> > (You can ignore the premature 5.20 pull request from some weeks ago.)
> 
> Gaah. That was the first thing I pulled this morning because it was
> the earliest.
> 
> And apparently you've rebased, so I can't even just pull on top.
> 
> Gaah. Now I'll have to go back and re-do everything I've done this morning.
> 
> PLEASE don't do things like this to me. If you know you are going to
> re-do a pull request, let me know early, so that I don't pull the old
> one.

Very sorry about that.  (The obvious change there was updating the version
numbers in the deprecation messages to 6.2, and I should have just sent a
seprate patch to fix those up.)

Dave

