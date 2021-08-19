Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8E13F15A4
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 10:58:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-I5irgvHyOVWsEsqr7uHFWQ-1; Thu, 19 Aug 2021 04:58:47 -0400
X-MC-Unique: I5irgvHyOVWsEsqr7uHFWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD51F100A252;
	Thu, 19 Aug 2021 08:58:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7533E5D9D5;
	Thu, 19 Aug 2021 08:58:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F2C64BB7C;
	Thu, 19 Aug 2021 08:58:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17J8t9Gw022673 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 04:55:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 322011000DB9; Thu, 19 Aug 2021 08:55:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD1E102F124
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 08:55:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9DE2801005
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 08:55:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-5uYPVmtLMXaUs__X3Nwe4A-1; Thu, 19 Aug 2021 04:55:02 -0400
X-MC-Unique: 5uYPVmtLMXaUs__X3Nwe4A-1
Received: by mail-pj1-f45.google.com with SMTP id n5so4461787pjt.4;
	Thu, 19 Aug 2021 01:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=gywVlIY+YAjIgxJm+mzM0vRV01mih4OUlQhYHWTpuM8=;
	b=YV0LRLkKx2CiwdOU9YdjGq9dwhDbLZvlv6p0QCYcsdwgwwp7OHRC70CRfn+rFAtNh6
	6RG6iIAImNpStNhU22WkzG7p3OqXGheoy/CYQ1I/oQr8awZw6tL5aJwlhBA3ED07ikDa
	htxYOo3gXeYC8eLu223UbOT6zCivzpjs3VGjJq+6stj6+KLivbhG/vOrw1p9Ptl67Gmq
	VUlm3Le27wGQ4N09HN3cK8oxm4c05iYUuPmGRKsQeOOCRfsOD5K3ykco/TY+BQpQmqR+
	5eP/BS/DeRi+C/PqKVIoxNnH/Ph4FnSFIFoJAkE4D+nd4IJMHqEKzCotIuhgkG4JlMro
	nAGA==
X-Gm-Message-State: AOAM532chnzcMT1+rIsujWK1kpP8aKAcBIhQJb7R5Rnh7XARYS42kXvh
	+v62HNfRLuGXIgNl9EBXlYGU9siOieQ=
X-Google-Smtp-Source: ABdhPJwrbKPsQiwDHz3T9qC4vgMId6360khFp+69YXyp+WCBKhXrTY21kbVBrsJuIk5UgL/RccGDvg==
X-Received: by 2002:a17:902:bc84:b029:12c:f9b9:db98 with SMTP id
	bb4-20020a170902bc84b029012cf9b9db98mr11049581plb.19.1629363300687;
	Thu, 19 Aug 2021 01:55:00 -0700 (PDT)
Received: from [166.111.139.106] ([166.111.139.106])
	by smtp.gmail.com with ESMTPSA id
	gl12sm7711777pjb.40.2021.08.19.01.54.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Aug 2021 01:55:00 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: ccaulfie@redhat.com, teigland@redhat.com
Message-ID: <79f8d302-f53f-3891-965a-bcb460ab15ca@gmail.com>
Date: Thu, 19 Aug 2021 16:54:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] [BUG] fs: dlm: possible ABBA deadlock
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

My static analysis tool reports a possible ABBA deadlock in the dlm 
filesystem in Linux 5.10:

dlm_recover_waiters_pre()
   mutex_lock(&ls->ls_waiters_mutex); --> line 5130
   recover_convert_waiter()
     _receive_convert_reply()
       lock_rsb()
         mutex_lock(&r->res_mutex); --> line 69

dlm_recover_waiters_post()
   lock_rsb()
     mutex_lock(&r->res_mutex); --> line 69
   mutex_lock(&ls->ls_waiters_mutex); --> line 5307

When dlm_recover_waiters_pre() and dlm_recover_waiters_post() are 
concurrently executed, the deadlock can occur.

I am not quite sure whether this possible deadlock is real and how to 
fix it if it is real.
Any feedback would be appreciated, thanks :)

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>


Best wishes,
Jia-Ju Bai

