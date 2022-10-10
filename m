Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C45FA6C2
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Oct 2022 23:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665435648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=g4uD7PcusRTs1FmNqEf5EidHCGLTkvzFZqNuu04jz9s=;
	b=Z5OLj2FZc+Dp3tbu5AHpVSU9PyZm6saZTdz9iexWjAHrVgJpSCvFcI94v1FmHJxIMF5Qhe
	wv3JvSh0RBNicbkfUBqsliWHH6fFhIHWqTLZmUoe10ls7dgB6BiZ+jn6L4KOg1BzUCqTId
	S9v0MMmRVGfIeFGRs/urZw2Nw92MmUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-KXpyAqtLMSe_-ol5ufXSwA-1; Mon, 10 Oct 2022 17:00:45 -0400
X-MC-Unique: KXpyAqtLMSe_-ol5ufXSwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96B3D803520;
	Mon, 10 Oct 2022 21:00:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6A9B4010D45;
	Mon, 10 Oct 2022 21:00:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 92EC11946A45;
	Mon, 10 Oct 2022 21:00:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD7B619465A3 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Oct 2022 21:00:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C6952156890; Mon, 10 Oct 2022 21:00:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 444F0215688F;
 Mon, 10 Oct 2022 21:00:41 +0000 (UTC)
Date: Mon, 10 Oct 2022 16:00:39 -0500
From: David Teigland <teigland@redhat.com>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20221010210039.GA30273@redhat.com>
References: <Y0IFEUjwXGZFf7bB@mail.google.com>
 <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
 <Y0IsXXYnS4DnWkMW@mail.google.com>
 <202210082044.51106145BD@keescook>
MIME-Version: 1.0
In-Reply-To: <202210082044.51106145BD@keescook>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v2][next] dlm: Replace one-element array
 with flexible-array member
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
Cc: cluster-devel@redhat.com,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 08, 2022 at 09:03:28PM -0700, Kees Cook wrote:
> On Sun, Oct 09, 2022 at 03:05:17PM +1300, Paulo Miguel Almeida wrote:
> > On Sat, Oct 08, 2022 at 05:18:35PM -0700, Kees Cook wrote:
> > > This is allocating 1 more byte than before, since the struct size didn't change. But this has always allocated too much space, due to the struct padding. For a "no binary changes" patch, the above "+ 1" needs to be left off.
> > 
> > That's true. I agree that leaving "+ 1" would work and produce a
> > no-binary-changes patch due to the existing padding that the structure
> > has. OTOH, I thought that relying on that space could bite us in the
> > future if anyone tweaks the struct again...so my reaction was to ensure 
> > that the NUL-terminator space was always guaranteed to be there.
> > Hence, the change on c693 (objdump above).
> > 
> > What do you think? Should we keep or leave the above
> > "+ 1" after the rationale above?
> 
> I think it depends on what's expected from this allocation. Christine or
> David, can you speak to this?

Hi, thanks for picking through that.  Most likely the intention was to
allow up to 64 (DLM_LOCKSPACE_LEN) character names, and then use the
ls_name[1] for the terminating byte.  I'd be happy to take the patch
replacing the one-element name.  Or, if you'd like to drop it, then we'll
eliminate it along with a cleanup of name/namelen more broadly.

Dave

