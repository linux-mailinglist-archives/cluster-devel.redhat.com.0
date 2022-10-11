Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA045FBDC0
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Oct 2022 00:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665526706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XOz+D3qN+D5XSjeZhjdEZw1Edyfh9x16KWqNTlE6IJw=;
	b=P04Rm6umBl+4Km+BC/XXZ4QTJ2dIdQi+TjVW/fowHtkjSNLO3sil05ShTwmHqJu13m6vSV
	qF+r0xAgumJqNY6apwS2JRm6HM4/tTbM6iwby1aGxaL+sKK3fLf1HEKhM5qJMbqB8t2MCC
	MivND8RLhlTD+cTtIaRUqI6WMWg19gw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-D6tcJwG9NDyf8p9nNVvnBA-1; Tue, 11 Oct 2022 18:18:23 -0400
X-MC-Unique: D6tcJwG9NDyf8p9nNVvnBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3F2F806002;
	Tue, 11 Oct 2022 22:18:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1863E40E9920;
	Tue, 11 Oct 2022 22:18:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA8B019465A0;
	Tue, 11 Oct 2022 22:18:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 644E71946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 22:18:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 479542166B30; Tue, 11 Oct 2022 22:18:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 402B82166B2F
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 22:18:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2179E185A794
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 22:18:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-5FuavvReOe6fs443Ky6lSg-1; Tue, 11 Oct 2022 18:18:16 -0400
X-MC-Unique: 5FuavvReOe6fs443Ky6lSg-1
Received: by mail-pf1-f177.google.com with SMTP id i3so14773082pfk.9
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 15:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOz+D3qN+D5XSjeZhjdEZw1Edyfh9x16KWqNTlE6IJw=;
 b=hedJtlhHxgBBos6WTxQWOE55O8cMcn8wbF64jAqbeFaU5Yfcbjq9zF4801klw52y27
 FzZf1wjqTKm7/tYTsjC2txqKL3PtHJdIGD/XWUExXRCRSGnGrC/Ge0ALV1YRBWEpICrR
 WIuxXu10SjR/4INnTgPxIU7psL+ZW9j9fVQqlETgkoZPVRHSFbrZyNAuWDziaNpbgfzL
 PyltLATe7t4mDKjDqDUK4D3fE79nQgXkekXPF/8KJO0cVPbQm29BkVQoVFcANiXcuKQQ
 nX86gD99F0qRbX+IIHmF3P3+3XrcOV8gyyBonOYrUyuQkT89lBTGEwG32g1dFkpHWaCG
 7Atw==
X-Gm-Message-State: ACrzQf0l8V4GIWZTqYx52GnyGK5PDCHYbNG425Dsu6XYTp4j9cI+YGzN
 9sbyOOARkasmui0/QFdxr9fQmA==
X-Google-Smtp-Source: AMsMyM7zgBTOsL0p7tJMXcEjncw8aWga9QOJV3/IxOX8GSssbmu2xYJXxhXT/zqSz6TG49A5FGiRPw==
X-Received: by 2002:a63:1a4c:0:b0:43b:e648:a7a4 with SMTP id
 a12-20020a631a4c000000b0043be648a7a4mr23134321pgm.7.1665526695285; 
 Tue, 11 Oct 2022 15:18:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a1709027e0d00b00172973d3cd9sm9112009plm.55.2022.10.11.15.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 15:18:14 -0700 (PDT)
Date: Tue, 11 Oct 2022 15:18:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Message-ID: <202210111518.A6E8A0FD@keescook>
References: <202210111305.743F591@keescook> <Y0XQsqdRzlrSpgOh@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0XQsqdRzlrSpgOh@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v5] [next] dlm: replace one-element
 array with fixed size array
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 12, 2022 at 09:23:14AM +1300, Paulo Miguel Almeida wrote:
> One-element arrays are deprecated. So, replace one-element array with
> fixed size array member in struct dlm_ls, and refactor the rest of the
> code, accordingly.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/228
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
> Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

