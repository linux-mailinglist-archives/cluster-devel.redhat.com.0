Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAA5FBB7B
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 21:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665517539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=x7fp4o/fuoo84Iny9QirCBuuHWzfg4C+01s/ewf2ktg=;
	b=cOsyMiP7QiNnWqDAUFXgeW8Z9WQtmo3RyvDZfpqpD+AH3eQElxFcUJuQRYfVf251g/EyY0
	14sMN+mT4be9XQxVgETjIq7DvwjKAzlul+0s14S2/r2VOaS9TvmjkH5AHevcnFtbD0Fb+d
	H1j3oFo0DWJ5PH573K4EaLryCOMim40=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-2K7_93DCM_-hPpgd8DOGyw-1; Tue, 11 Oct 2022 15:45:36 -0400
X-MC-Unique: 2K7_93DCM_-hPpgd8DOGyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B62723C10EC8;
	Tue, 11 Oct 2022 19:45:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C39F91759E;
	Tue, 11 Oct 2022 19:45:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8CB4119465A2;
	Tue, 11 Oct 2022 19:45:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADD69194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 19:45:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DF48C15BB3; Tue, 11 Oct 2022 19:45:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8675FC15BA4
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:45:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68C83185A794
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:45:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-XcQnarvLNRSNFmJFt1A-Pw-1; Tue, 11 Oct 2022 15:45:26 -0400
X-MC-Unique: XcQnarvLNRSNFmJFt1A-Pw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E536ECE18CE;
 Tue, 11 Oct 2022 19:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D173CC433C1;
 Tue, 11 Oct 2022 19:37:50 +0000 (UTC)
Date: Tue, 11 Oct 2022 14:37:40 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Message-ID: <Y0XGBKtNOXIz+1T6@work>
References: <Y0XAxX4g/9N6qdnD@mail.google.com> <Y0XDAtQ4eYTgwIgM@work>
 <Y0XD9tTd0ahj2jRZ@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0XD9tTd0ahj2jRZ@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] [next] dlm: replace one-element array
 with fixed size array
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 12, 2022 at 08:28:54AM +1300, Paulo Miguel Almeida wrote:
> On Tue, Oct 11, 2022 at 02:24:50PM -0500, Gustavo A. R. Silva wrote:
> > On Wed, Oct 12, 2022 at 08:15:17AM +1300, Paulo Miguel Almeida wrote:
> > > One-element arrays are deprecated. So, replace one-element array with
> > > fixed size array member in struct dlm_ls, and refactor the rest of the
> > > code, accordingly.
> > > 
> > > Link: https://github.com/KSPP/linux/issues/79
> > > Link: https://github.com/KSPP/linux/issues/228
> > > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
> > > Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/
> > > 
> > > Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> > 
> > I think this should be versioned as v3.
> > 
> I didn't add v3 here because the the patch got changed from 'replacing
> [1]-array with flex-array' to 'replacing [1]-array to fixed-size array'.

The issue remains the same, and there have been comments and feedback on
previous patches. So, yep, v3 seems appropiate for this patch. :)

> 
> Let me know if you still want me to send it as v3 instead.

I think next one would be v4.

Also, when versioning patches it is also necessary to include a version
change log.

Thanks
--
Gustavo

