Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AE5FBB9D
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 21:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665518161;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iyHcM7UXo6+KI6U5ZBV2AMB4YpVhQ1f2WHVW8eRrXJQ=;
	b=fZFOaTusVdS7dIo4KaWfadtkn8KOW5KyWFC/7JBEcQTJFqq8iDidDgI09beTaENZgGOWyS
	a+eyfqknsxqhxnCwR0bMdJNvCgiDio+c+je42GOrsrOKnsWFh4dXbnwpWpcaG0nKrYXafD
	OX4ioz6IYnzXLDo1y7EH703owB1OVkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-ZTVgTYYmPcifUiA1E4NG1g-1; Tue, 11 Oct 2022 15:55:58 -0400
X-MC-Unique: ZTVgTYYmPcifUiA1E4NG1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EFF3811E81;
	Tue, 11 Oct 2022 19:55:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4140C207B36F;
	Tue, 11 Oct 2022 19:55:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 151CF19465A2;
	Tue, 11 Oct 2022 19:55:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A67F8194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 19:55:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8256D2083A16; Tue, 11 Oct 2022 19:55:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AF82207B36F
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:55:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C27A3C3C962
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:55:55 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-2ECozWSYNGmp78u7yKWzVQ-1; Tue, 11 Oct 2022 15:55:53 -0400
X-MC-Unique: 2ECozWSYNGmp78u7yKWzVQ-1
Received: by mail-pj1-f47.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso14274942pjk.1; 
 Tue, 11 Oct 2022 12:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyHcM7UXo6+KI6U5ZBV2AMB4YpVhQ1f2WHVW8eRrXJQ=;
 b=HWTOx+5hjA9WLTVgq5xnbmtQN8CVtqFxvk6iutvhu+pYkvkaJ1dNpCYlE2mauwP50R
 xJoZaoVS36fmyOR4UCTcPuayEamVL4XdrOeIsw/dzSsMlPy9tu82r03HbzGiuAOTl14o
 X83JlFSEHdCXdIGwPc61EDsWkYUyNQONLeFG94JOOt9sPd+bk+MpvB0ciF1MXkCFhito
 lKQYdNknF+nqF4jDy3ggMfFgc32QPFbevtHF5f2akpHDLrjgRGzzY/C1FSZLo7Nh1xZF
 US4chvdu85LZVgnDagM3BEaKWCI2AwREbKe2mzWVmsMedmnCIWhR+N2tDg/+gqZlkvmy
 FiNQ==
X-Gm-Message-State: ACrzQf0NjPWSihDRL1mj8PJjKTDf5CvoUsRC8G/tibet4kbChBdPOYEi
 ca7GxZKCfl85jj1rt7vlKio=
X-Google-Smtp-Source: AMsMyM7LLekdikl1aZ5jBm10cgtOnnqRWxrMBOTuawgR59wT7LObyxPXHsnADegCTlpdIJZLxFd9OA==
X-Received: by 2002:a17:90b:1bd0:b0:205:ed0c:7e84 with SMTP id
 oa16-20020a17090b1bd000b00205ed0c7e84mr921987pjb.234.1665518152627; 
 Tue, 11 Oct 2022 12:55:52 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 lt23-20020a17090b355700b0020a9f7405aesm7070046pjb.13.2022.10.11.12.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 12:55:52 -0700 (PDT)
Date: Wed, 12 Oct 2022 08:55:46 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <Y0XKQnaufTfi5OzY@mail.google.com>
References: <Y0XAxX4g/9N6qdnD@mail.google.com> <Y0XDAtQ4eYTgwIgM@work>
 <Y0XD9tTd0ahj2jRZ@mail.google.com> <Y0XGBKtNOXIz+1T6@work>
MIME-Version: 1.0
In-Reply-To: <Y0XGBKtNOXIz+1T6@work>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2022 at 02:37:40PM -0500, Gustavo A. R. Silva wrote:
> On Wed, Oct 12, 2022 at 08:28:54AM +1300, Paulo Miguel Almeida wrote:
> > > 
> > I didn't add v3 here because the the patch got changed from 'replacing
> > [1]-array with flex-array' to 'replacing [1]-array to fixed-size array'.
> 
> The issue remains the same, and there have been comments and feedback on
> previous patches. So, yep, v3 seems appropiate for this patch. :)
> 
> > 
> > Let me know if you still want me to send it as v3 instead.
> 
> I think next one would be v4.
> 
> Also, when versioning patches it is also necessary to include a version
> change log.
> 
Fair enough. Will send a v4

Paulo A.

