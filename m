Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9219C5FBB5A
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 21:29:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665516552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=d9o2w1TYXttFTTjml30YJIaN8TXEmaRFT+y/H7e7rsw=;
	b=DERgPHwe2t5lRr7VjYIzrEl367HZy80Xhr1xyY1VxAW1pjDlmB///XF6DcQgRADF66ftpn
	sJfx1KMOQAPn/m30POp9TkftkYa73nTHLm/svbxOjNY/XTk3Qsz5Gje1NBJW1xS0Qj8hxm
	TQWnFIhZ+FJ6JFkZB3vW83mSFrbCQXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-hhNvNToJOvipvya2oKScxQ-1; Tue, 11 Oct 2022 15:29:09 -0400
X-MC-Unique: hhNvNToJOvipvya2oKScxQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00E1C87A388;
	Tue, 11 Oct 2022 19:29:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A53A6477F5F;
	Tue, 11 Oct 2022 19:29:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FEE019465A2;
	Tue, 11 Oct 2022 19:29:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 32903194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 19:29:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF13A477F6E; Tue, 11 Oct 2022 19:29:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B74E94A9254
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:29:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD0887A384
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:29:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-g_DnqdR3MG2uJb5yHKyGzA-1; Tue, 11 Oct 2022 15:29:02 -0400
X-MC-Unique: g_DnqdR3MG2uJb5yHKyGzA-1
Received: by mail-pj1-f52.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so17023998pjs.4; 
 Tue, 11 Oct 2022 12:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9o2w1TYXttFTTjml30YJIaN8TXEmaRFT+y/H7e7rsw=;
 b=ce1b3JR8t+NTj9DGcU+CWPUfuKWh+7e4PX9Q+z3iGwDAcYwfq5Qe5oobjbsq3VxN7f
 zYzqAStZtacqyKXsxjc9WZ3jSMzg2TrdD6nOACndU+reWgXdoE7h1bYJmKHoPoQtfiQz
 30mF66ap5G3Xai8kETRry/RjJFskxnAU04oVq61WXxvZb3utVHQz+4+hBMAHvnatGwHp
 p8EMf0g2c47MIkkJYTMTgj0La3NU3/OPl5+V6NYp0Khw7lkAjpY8FkREIuAxK2zwth/I
 SkqR93BgCFU6Dio0VFv+sACvhKKbu8ovGcL4URgTqA8O+vSs/OUS5xyck/Huvhpg/+CF
 cw8A==
X-Gm-Message-State: ACrzQf0kNdYOJh8IDaip+BkWOFeoijCjxJZGM2PbS+X98B0h0DLKrbo6
 vd5+TAg2Mi6841y0Am/iCwT1xfI5GnjiGg==
X-Google-Smtp-Source: AMsMyM7dTD9RlFu9H5B9jEVB/wKJRWOR006AKjiJYpzVFTj2wSDi2tFyAjbzJJ45g1ETN/A6035lbw==
X-Received: by 2002:a17:90b:4b48:b0:20a:8ea4:a18d with SMTP id
 mi8-20020a17090b4b4800b0020a8ea4a18dmr775859pjb.75.1665516540714; 
 Tue, 11 Oct 2022 12:29:00 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 d10-20020a17090a628a00b0020aaa678098sm553263pjj.49.2022.10.11.12.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 12:29:00 -0700 (PDT)
Date: Wed, 12 Oct 2022 08:28:54 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <Y0XD9tTd0ahj2jRZ@mail.google.com>
References: <Y0XAxX4g/9N6qdnD@mail.google.com>
 <Y0XDAtQ4eYTgwIgM@work>
MIME-Version: 1.0
In-Reply-To: <Y0XDAtQ4eYTgwIgM@work>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2022 at 02:24:50PM -0500, Gustavo A. R. Silva wrote:
> On Wed, Oct 12, 2022 at 08:15:17AM +1300, Paulo Miguel Almeida wrote:
> > One-element arrays are deprecated. So, replace one-element array with
> > fixed size array member in struct dlm_ls, and refactor the rest of the
> > code, accordingly.
> > 
> > Link: https://github.com/KSPP/linux/issues/79
> > Link: https://github.com/KSPP/linux/issues/228
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
> > Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/
> > 
> > Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> 
> I think this should be versioned as v3.
> 
I didn't add v3 here because the the patch got changed from 'replacing
[1]-array with flex-array' to 'replacing [1]-array to fixed-size array'.

Let me know if you still want me to send it as v3 instead.

Paulo A.

