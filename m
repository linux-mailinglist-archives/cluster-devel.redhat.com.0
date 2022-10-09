Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9725F89D9
	for <lists+cluster-devel@lfdr.de>; Sun,  9 Oct 2022 08:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665298657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MiONZD1MjJpYCgG93jI2Gs8sYkuUt5X1CpMtDB0TPm4=;
	b=A+S7PUc+01vZLS+Eg1P4ZlGywUcKwAmRVUWQebeWylB3OqptI+8ta2OzG4fjL4717zt1y/
	R7tPK3GC1ZsdJnIm5e7+S+Uij7J/a86MJkWuMy9zrr1pLxEQc+xXwk6Ln/SkbaNxzdPKr4
	PLDVngNXfiqZs/uVKShj2F9sb/RWGqY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-RB_VUr8LMhSmDzuF0Y0Kcg-1; Sun, 09 Oct 2022 02:57:30 -0400
X-MC-Unique: RB_VUr8LMhSmDzuF0Y0Kcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B2CB85A583;
	Sun,  9 Oct 2022 06:57:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B184B17E6;
	Sun,  9 Oct 2022 06:57:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 23A9A1946595;
	Sun,  9 Oct 2022 06:57:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8D011946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 06:57:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 897D240C9567; Sun,  9 Oct 2022 06:57:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8242440C9559
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 06:57:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3FFD855420
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 06:57:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-lVWpc0SMPlqo6PLj7Q8l6Q-1; Sun, 09 Oct 2022 02:57:21 -0400
X-MC-Unique: lVWpc0SMPlqo6PLj7Q8l6Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BC5C60AE9;
 Sun,  9 Oct 2022 06:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F278C433C1;
 Sun,  9 Oct 2022 06:51:13 +0000 (UTC)
Date: Sun, 9 Oct 2022 08:51:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Message-ID: <Y0JvjAfnOB13y2wL@kroah.com>
References: <Y0ICbf8tCtXMn+W0@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0ICbf8tCtXMn+W0@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH][next] dlm: Replace one-element array
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 09, 2022 at 12:06:21PM +1300, Paulo Miguel Almeida wrote:
> paulo.miguel.almeida.rodenas@gmail.com
> Bcc: 
> Subject: [PATCH][next] dlm: Replace one-element array with flexible-array
>  member
> Reply-To: 

Something went wrong here :(

