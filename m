Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2B7C4AD0
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 08:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697006462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GDu4dHc2qdIWX4QjUINTI8nxdGjd68jibh3/1T2CEUk=;
	b=NcArPt1ZIG0g27cmWOd2YFFcSf406Xi4fXfkzJF2zDxE5XrHMbjDhEVD09tn+5DeeeSGVI
	NhS/eD5brnYE6FrCeHIF8bvpbDTg14d5WDvq1G7oBLMze6Li5PUquWtfNtXzsLQLYpgwWI
	/lD0/2FFomCi6mDTF2nNUJmPwuKqm7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-MLfjT3MuPpWhzMCVAXpOvw-1; Wed, 11 Oct 2023 02:40:59 -0400
X-MC-Unique: MLfjT3MuPpWhzMCVAXpOvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 758DD8F5DA1;
	Wed, 11 Oct 2023 06:40:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D295B492C3E;
	Wed, 11 Oct 2023 06:40:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A5E519466E7;
	Wed, 11 Oct 2023 06:40:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A1B31946597 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 267B51C06533; Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2801C060DF
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03EC48F5DA1
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-YyNZSlMwMN642_b3oifw4w-1; Wed,
 11 Oct 2023 02:34:17 -0400
X-MC-Unique: YyNZSlMwMN642_b3oifw4w-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AAF62CE1AA9;
 Wed, 11 Oct 2023 06:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DBEC433C9;
 Wed, 11 Oct 2023 06:24:16 +0000 (UTC)
Date: Wed, 11 Oct 2023 08:24:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <2023101105-flashing-image-8778@gregkh>
References: <20231010220448.2978176-1-aahringo@redhat.com>
 <20231010220448.2978176-3-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231010220448.2978176-3-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH RESEND 3/8] fs: dlm: Remove some useless
 memset()
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 10, 2023 at 06:04:43PM -0400, Alexander Aring wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> There is no need to clear the buffer used to build the file name.
> 
> snprintf() already guarantees that it is NULL terminated and such a
> (useless) precaution was not done for the first string (i.e
> ls_debug_rsb_dentry)
> 
> So, save a few LoC.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/debug_fs.c | 5 -----
>  1 file changed, 5 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

