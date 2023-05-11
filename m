Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D66FF725
	for <lists+cluster-devel@lfdr.de>; Thu, 11 May 2023 18:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683822396;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ndBrQ3w0AHpWG5hJlqPBYuez6El2zpi53yJoXY7Mu50=;
	b=jF4I7bWF1DxTDqpL+PpUzAWYsCqt9c/XccN8LG1GJYgCNYStoDuiaguZjUV6t2qYgiz/Xw
	WmTRQtLKTHqurm2XU/HooLY5K9vAbLvQRMfaBgPeM/UX0WLuy/3orCOYmY86ii+KjIUUE6
	rBMi87f6AXUq67kj/pg10QsHcczoHQM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-GIwhUemLOIK_efC4MA3DDw-1; Thu, 11 May 2023 12:26:35 -0400
X-MC-Unique: GIwhUemLOIK_efC4MA3DDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3465789B868;
	Thu, 11 May 2023 16:26:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFC3492C13;
	Thu, 11 May 2023 16:26:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5452819451D3;
	Thu, 11 May 2023 16:26:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 412FC19451D1 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 11 May 2023 16:26:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20458C16024; Thu, 11 May 2023 16:26:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F5BC15BA0
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 16:26:31 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF9A1C0898E
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 16:26:30 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-xgGuRrAmNdeqQpnw8SJnKA-1; Thu, 11 May 2023 12:26:28 -0400
X-MC-Unique: xgGuRrAmNdeqQpnw8SJnKA-1
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-51b33c72686so5911046a12.1
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 09:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683822387; x=1686414387;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ndBrQ3w0AHpWG5hJlqPBYuez6El2zpi53yJoXY7Mu50=;
 b=IyzIwbMWvbf4AZkHWgUeWiCa0KtnYZqnUoZ+G1SZKnoCPCGvBvsGUZGqHXdWJ1u03e
 +2IFnG455qNVOlS1lkkSAMEYGTnEoxP6COVzH0KNn+pOB7zCDFr19Q7/o4G4Qz4Am9Bh
 a7I2h6DZ39uIsrqjGSeTY+euDpHnnmoxPyslJc1yr/r/2FMIq5X9iY7cmrmRs6k7Dsoo
 kakNQBZh4NHhdntqmCuu0L12qTUfA0dYDclIZQrwzgZXYURwgx1Hrf9apWtCnxA/TD+x
 UFR2X+JYMSjtj0SOq5DgstYuNJWEZs0pz+ChFEIfD2PoL7vpQfqWpwnRW2DznzKsjw8W
 +aGA==
X-Gm-Message-State: AC+VfDxPTdmUrUU0Dybl9inHoHVkf7SANfkSN0lTnX1Q0co1I6aRg36A
 gccQOn3xLraXC0zEhJC6q8PGUQ==
X-Google-Smtp-Source: ACHHUZ5y1saTqsWRD5lKY3DfBma0oCNPx8Yo7rLHR+umtawiVR8DGcUWb5J5pFrfL6M10DRtlR2reQ==
X-Received: by 2002:a17:902:d491:b0:1ab:26a8:5401 with SMTP id
 c17-20020a170902d49100b001ab26a85401mr31973723plg.31.1683822386770; 
 Thu, 11 May 2023 09:26:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 m17-20020a170902bb9100b001aaef9d0102sm6120820pls.197.2023.05.11.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:26:26 -0700 (PDT)
Date: Thu, 11 May 2023 09:26:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Message-ID: <202305110926.4A833D9@keescook>
References: <20230510221237.3509484-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230510221237.3509484-1-azeemshaikh38@gmail.com>
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
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: chromium.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 10, 2023 at 10:12:37PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

