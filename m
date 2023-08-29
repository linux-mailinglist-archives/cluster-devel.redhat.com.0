Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836F78CA39
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 19:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693328889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eQhFPjtlYLcoapnQI3+6tHLH2wsZNiQelrUO842diMA=;
	b=Ms5lVP1oOh1KVXfxfadfM6eK+DQ3txEKomESxVfJrMyI48Gl3G1aCPAbdOHtAaMobpaomg
	Gm0HMiKTWxUXJP/+NKy5wJIx8P2cAbcv8L1wEAk0Vhjv/P79DXXVYYd2zjEIDDU+l/kMmI
	WhnZQ5ys7+mx7mItdW6ngYRt/srlBns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-erOYpzlvNsSWyyTyTwkvDg-1; Tue, 29 Aug 2023 13:08:05 -0400
X-MC-Unique: erOYpzlvNsSWyyTyTwkvDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07EEE800D9C;
	Tue, 29 Aug 2023 17:08:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7EAE40C6F4E;
	Tue, 29 Aug 2023 17:08:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51A141946A4A;
	Tue, 29 Aug 2023 17:08:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F416F19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 17:08:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B00B6C15BB8; Tue, 29 Aug 2023 17:08:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9975C15BAE
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 17:08:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 809BF2807D65
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 17:08:00 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-Avu16VG_M8iaqgCcohQFYA-1; Tue, 29 Aug 2023 13:07:58 -0400
X-MC-Unique: Avu16VG_M8iaqgCcohQFYA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31ad77537ebso2927867f8f.0
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 10:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328876; x=1693933676;
 h=content-transfer-encoding:cc:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eQhFPjtlYLcoapnQI3+6tHLH2wsZNiQelrUO842diMA=;
 b=e526tKHjCqJrN8q9t0+Op+wWo+4pzoLR8BVchEGTQWhf36Eqf3cSMCmg8uqnlRu+xi
 kTORbYbr97v5Yyj9X9wr3Mp3A1ikKrIVCUBp8l4zmmO4FdTEWK3S6QWgnf4Od+TkBy25
 AheIUWr+Y2ndagARE7ndggKi+ztR6/cdiUYqjG35JPXogMOUz8o3kgigHLr6insPJFXa
 EceO5IqivX4DMY3X4oBNDizeOWrhlz6q5ZQZRvBhUuhvF7US6T2JeWlZEd47c68mCUHr
 udGFE0uB1KO/c33dFeCgk4TGkABiWKnhO7mwBWgXAsLlBu+5jmRoIV8prgotNBL0iz0/
 3mQA==
X-Gm-Message-State: AOJu0YwbGO5Ara4sRhohccx2SKe88s78bF7pViG1IBqSyC7oCY7ldd8i
 QJ6/tzPEIoeeSWMkA7S4xk3cgqZOFnUCWVvqPUkjvSfL9FbOVgpJKQQDlY89+lYYHvyTLTjECeW
 P8Hr/vS6V205Qx/SStkcteOEWu+/WYDTSl50SH5KFBQ/7snAb0LUM+iLh+bvkSKD/bPrzpwxfVD
 pBqZDG
X-Received: by 2002:a5d:560c:0:b0:31c:488e:ff33 with SMTP id
 l12-20020a5d560c000000b0031c488eff33mr18720306wrv.58.1693328876704; 
 Tue, 29 Aug 2023 10:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOiwWfCAox03zTNnyqyrD39seU9dX+QHTpK8wu08ArO4hFDxz2MDIhfyvTXp5zaPOTn66gTg==
X-Received: by 2002:a5d:560c:0:b0:31c:488e:ff33 with SMTP id
 l12-20020a5d560c000000b0031c488eff33mr18720293wrv.58.1693328876346; 
 Tue, 29 Aug 2023 10:07:56 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 y14-20020adfee0e000000b0031c56218984sm14221600wrn.104.2023.08.29.10.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:07:55 -0700 (PDT)
Message-ID: <9830d291-a86b-df63-0b03-c99c583609c8@redhat.com>
Date: Tue, 29 Aug 2023 18:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Price <anprice@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [ANNOUNCE] Goodbye cluster-devel,
 hello gfs2@lists.linux.dev
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
Cc: gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

As cluster-devel is now only used for gfs2 and dlm development, we will 
be moving them to a new list hosted by kernel.org alongside other Linux 
subsystems' lists. The new list is gfs2@lists.linux.dev and it will be 
used for both gfs2 and dlm development.

The Linux MAINTAINERS file and other references will be updated shortly 
to reflect the change. Information about the list hosting can be found here:

https://subspace.kernel.org/lists.linux.dev.html

To subscribe, send an email (the subject and body doesn't matter) to:

Subscribe:   gfs2+subscribe@lists.linux.dev
Unsubscribe: gfs2+unsubscribe@lists.linux.dev

If you prefer, the list can also be read via NNTP at:

nntp://nntp.lore.kernel.org/dev.linux.lists.gfs2

The archives can be found here:

https://lore.kernel.org/gfs2/

and filters can use the "List-Id: <gfs2.lists.linux.dev>" header.

Thanks,
Andy

