Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD470C88A
	for <lists+cluster-devel@lfdr.de>; Mon, 22 May 2023 21:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684784399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=15lSZRZhXLomY0U2NRYU9uW0smeWq7pcEslVONXUi3w=;
	b=JTO5GO8IL5DbWL5UCHxNOll3MXQ46RVfXx39MwTbq4px5Rg7fjnmaPtG08UnazOQt6n5Fm
	UfwH2ZAO0o/kPJRVeNBoS4CK9HoruVErnRD5O8fXRi16pj0XlWoEBduYbMNUf7urtOF29i
	eSY5zduuBrZ60YbC+MtEdt/beumrmyY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-DA-HNHnaPDe_qhlfmLamDQ-1; Mon, 22 May 2023 15:39:56 -0400
X-MC-Unique: DA-HNHnaPDe_qhlfmLamDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 152E8811E78;
	Mon, 22 May 2023 19:39:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41CE41121314;
	Mon, 22 May 2023 19:39:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D607F19465B1;
	Mon, 22 May 2023 19:39:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C94F1946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 22 May 2023 19:39:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67FCAC1ED9A; Mon, 22 May 2023 19:39:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D429C1ED99
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 19:39:51 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 363E1800BFF
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 19:39:51 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-3H7HEocaPxmbHr60i4wl0g-1; Mon, 22 May 2023 15:39:49 -0400
X-MC-Unique: 3H7HEocaPxmbHr60i4wl0g-1
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-64d3578c25bso4176983b3a.3
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 12:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684784388; x=1687376388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15lSZRZhXLomY0U2NRYU9uW0smeWq7pcEslVONXUi3w=;
 b=YRXg3no9V+HSQ4i45SfU7Z4r2AmkYJln/LTI1dRqpQMhYat92/3cw/KOlwYAT4gdpf
 ofx6/xpK8rLKYw0H+r9Jo8n6hRNrKsYQBelfJKf/Z4lbP75Q5Qx1/vOQcmM4WcJQbppU
 7nbMATl4/Nfs/m+2N2WFgEmgfXZNIO2DLnq8EMuOuhJrZgf5T4ZY0VBgvI6YhhQBWO3/
 +K4eOLxYRgXHFlWQO6SYbTNVa4o80ln9EV5Yo+nawXknA+5xTpskgL1wahoolvQtDBsB
 a6pxyhQE0l3yaOmULSsa7BFJ3T0ep+EH61zFZ2Cxmy7oO8rbBjltcrFQLwI9vLhelR2T
 4Ezw==
X-Gm-Message-State: AC+VfDyfI7ldTotbygmB5PQOrOAb9vCi9j387qEAHJvuAdXQr0oOfACm
 6dc+kF1WaKdfPT5RZ7CLFrrzjQ==
X-Google-Smtp-Source: ACHHUZ4kzfOePZUuovzfabT8AgRib6y/nHwVGmMvBg8fdTKcPNszB02HKZi7Ot66DeoLW/DPcx7wKw==
X-Received: by 2002:a05:6a20:549d:b0:10b:bf0e:3bda with SMTP id
 i29-20020a056a20549d00b0010bbf0e3bdamr3899463pzk.2.1684784387947; 
 Mon, 22 May 2023 12:39:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 i24-20020aa787d8000000b0064d3e4c7658sm4602374pfo.96.2023.05.22.12.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 12:39:47 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com,
	teigland@redhat.com,
	ccaulfie@redhat.com
Date: Mon, 22 May 2023 12:39:34 -0700
Message-Id: <168478437619.244538.1491421946258356417.b4-ty@chromium.org>
In-Reply-To: <20230510221237.3509484-1-azeemshaikh38@gmail.com>
References: <20230510221237.3509484-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] dlm: Replace all non-returning strlcpy
 with strscpy
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
Cc: cluster-devel@redhat.com, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 10 May 2023 22:12:37 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] dlm: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/30ad0627f169

-- 
Kees Cook

